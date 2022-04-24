import 'package:clienthealth/Screens/appoint_add.dart';
import 'package:clienthealth/Screens/doc_details.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorsScreen extends StatelessWidget {
  static const routeName = "/DoctorsScreen";
  @override
  Widget build(BuildContext context) {
    final String hospitalId = ModalRoute.of(context).settings.arguments;
    String appBarTitle;
    if (hospitalId == 'h1') {
      appBarTitle = 'Doctors in Pune';
    } else if (hospitalId == 'h2') {
      appBarTitle = 'Doctors in Jodhpur';
    } else if (hospitalId == 'h3') {
      appBarTitle = 'Doctors in Delhi';
    } else if (hospitalId == 'h4') {
      appBarTitle = 'Doctors in Raipur';
    } else {
      appBarTitle = 'Doctors in Guwahati';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/appBg.jpg'), fit: BoxFit.cover)),
        padding: EdgeInsets.all(8),
        child: StreamBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final chatDocs = snapshot.data.docs;
            return ListView.builder(
                itemCount: chatDocs.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                        DocDetails.routeName,
                        arguments: chatDocs[index].data()['docName']),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 120,
                              width: 80,
                              child: GFAvatar(
                                backgroundColor: Colors.white,
                                shape: GFAvatarShape.standard,
                                child: Image.network(
                                  chatDocs[index].data()['docimageUrl'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                  top: 20,
                                )),
                                Container(
                                  width: 160,
                                  child: Text(
                                    chatDocs[index].data()['docName'],
                                    softWrap: true,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 160,
                                  child: Text(
                                    'Speciality :' +
                                        chatDocs[index].data()['docTitle'],
                                    softWrap: true,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey[700]),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(padding: EdgeInsets.only(top: 10)),
                                TextButton.icon(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        DocDetails.routeName,
                                        arguments:
                                            chatDocs[index].data()['docName']);
                                  },
                                  icon: Icon(Icons.card_membership),
                                  label: Container(
                                    width: 85,
                                    child: Text(
                                      'Doctor Details',
                                      softWrap: true,
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                                TextButton.icon(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        AppointmentAdd.routeName,
                                        arguments:
                                            chatDocs[index].data()['docName']);
                                  },
                                  icon: Icon(Icons.bookmarks_sharp),
                                  label: Container(
                                    width: 85,
                                    child: Text(
                                      'Book Appointment',
                                      softWrap: true,
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
          stream: FirebaseFirestore.instance
              .collection('doctor')
              .where('hospitalId', isEqualTo: hospitalId.toString())
              .snapshots(),
        ),
      ),
    );
  }
}
