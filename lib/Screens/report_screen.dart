import 'dart:isolate';
import 'dart:ui';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

import '../Widgets/app_drawer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReportsScreen extends StatefulWidget {
  static const routeName = '/Reports';

  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  void _requestDownload(String url) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final baseStorage = await getExternalStorageDirectory();
      FlutterDownloader.enqueue(
          url: url,
          fileName: 'Download',
          savedDir: baseStorage.path,
          showNotification: true,
          openFileFromNotification: true);
    }
  }

  ReceivePort _receivePort = ReceivePort();
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    SendPort sendPort = IsolateNameServer.lookupPortByName('downloading');
    sendPort.send([id, status, progress]);
  }

  @override
  void initState() {
    IsolateNameServer.registerPortWithName(
        _receivePort.sendPort, 'downlaoding');

    FlutterDownloader.registerCallback(downloadCallback);
    super.initState();
  }

  String enteredTitle;
  String imgUrl;
  final _titleController = TextEditingController();
  File _reportImg;

  void _pickImg(ImageSource imageSource) async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(
      source: imageSource,
    );
    final pickedImageFile = File(pickedImage.path);

    setState(() {
      _reportImg = pickedImageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          TextButton.icon(
              onPressed: () {
                enteredTitle = null;
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20.0)), //this right here
                        child: Container(
                          height: 300,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                    controller: _titleController,
                                    decoration: InputDecoration(
                                        labelText: 'Report Name'),
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value.isEmpty || value.length < 3) {
                                        return 'Please give a name to the report';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onFieldSubmitted: (value) {}),
                                SizedBox(
                                  height: 5,
                                ),
                                Column(
                                  children: [
                                    TextButton.icon(
                                        onPressed: () =>
                                            _pickImg(ImageSource.camera),
                                        icon: Icon(Icons.add_a_photo),
                                        label: Text(
                                          'Click from Camera',
                                          softWrap: true,
                                        )),
                                    TextButton.icon(
                                        onPressed: () async {
                                          _pickImg(ImageSource.gallery);
                                        },
                                        icon: Icon(Icons.upload_file),
                                        label: Text(
                                          'Upload your Report',
                                          softWrap: true,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: 130,
                                      child: ElevatedButton.icon(
                                        onPressed: () async {
                                          enteredTitle = _titleController.text;
                                          final user =
                                              FirebaseAuth.instance.currentUser;
                                          final userData =
                                              await FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(user.uid)
                                                  .get();
                                          final ref = FirebaseStorage.instance
                                              .ref()
                                              .child('report_images')
                                              .child(enteredTitle +
                                                  '_' +
                                                  userData.data()['username'] +
                                                  '.jpg');

                                          UploadTask uploadTask =
                                              ref.putFile(_reportImg);
                                          uploadTask.whenComplete(() async {
                                            imgUrl = await ref.getDownloadURL();
                                          });
                                          if (enteredTitle.isNotEmpty &&
                                              imgUrl != null) {
                                            FirebaseFirestore.instance
                                                .collection('reports')
                                                .add({
                                              'reportName':
                                                  enteredTitle.toUpperCase(),
                                              'reportFile': imgUrl,
                                              'timeStamp': Timestamp.now(),
                                              'username':
                                                  userData.data()['username'],
                                              'userId': user.uid,
                                            });
                                            _titleController.clear();
                                            imgUrl = null;
                                            Navigator.of(context).pop();
                                          } else {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                Future.delayed(
                                                    Duration(seconds: 5), () {
                                                  Navigator.of(context)
                                                      .pop(true);
                                                });
                                                return Dialog(
                                                    child: Container(
                                                  height: 130,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Report is Uploading',
                                                            softWrap: true,
                                                            style: TextStyle(
                                                                fontSize: 26),
                                                          ),
                                                          Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Please Wait...',
                                                                  softWrap:
                                                                      true,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          26),
                                                                ),
                                                                CircularProgressIndicator(
                                                                  valueColor: new AlwaysStoppedAnimation<
                                                                          Color>(
                                                                      Colors
                                                                          .blue),
                                                                )
                                                              ]),
                                                          TextButton(
                                                              onPressed: () =>
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(),
                                                              child: Text(
                                                                "Okay !",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20),
                                                              ))
                                                        ]),
                                                  ),
                                                ));
                                              },
                                            );
                                          }
                                        }, // validation and submittion
                                        label: Text(
                                          "Save",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        icon: const Icon(Icons.save),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 130,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          enteredTitle = null;

                                          Navigator.of(context).pop();
                                        }, // validation and submittion
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              icon: Icon(Icons.file_upload),
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all(EdgeInsets.only(right: 10)),
                  foregroundColor: MaterialStateProperty.all(Colors.black)),
              label: Text(
                'Upload File',
                style: TextStyle(fontSize: 18),
              ))
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text(
          'User Reports',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 80),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/appBg.jpg'), fit: BoxFit.cover)),
        child: StreamBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final chatDocs = snapshot.data.docs;
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .8,
                    mainAxisSpacing: 10),
                itemCount: chatDocs.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  String imgUrl = chatDocs[index].data()['reportFile'];
                  final user = FirebaseAuth.instance.currentUser;
                  return chatDocs[index].data()['userId'] == user.uid
                      ? GridTile(
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              Image.network(
                                chatDocs[index].data()['reportFile'],
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                left: 150,
                                top: 10,
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () async =>
                                        await FirebaseFirestore.instance
                                            .runTransaction(
                                      (Transaction myTransaction) async {
                                        myTransaction
                                            .delete(chatDocs[index].reference);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ), //image
                          footer: Card(
                            margin: EdgeInsets.all(9),
                            color: Colors.indigo,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: GridTileBar(
                              //  subtitle: Text('Tap To Read More It..'),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.file_download,
                                  size: 28,
                                  color: Colors.yellow,
                                ),
                                onPressed: () => _requestDownload(imgUrl),
                              ),
                              backgroundColor: Colors.indigo,
                              title: Text(
                                chatDocs[index].data()['reportName'],
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold), //filename
                                //softWrap: true,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              ),
                            ),
                          ),
                        )
                      : null;
                });
          },
          stream: FirebaseFirestore.instance
              .collection('reports')
              .orderBy('timeStamp', descending: true)
              .snapshots(),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
