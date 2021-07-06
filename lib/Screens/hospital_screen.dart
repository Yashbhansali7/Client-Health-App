import 'package:clienthealth/Screens/hospital_details.dart';
import 'package:flutter/material.dart';
import '../Widgets/app_drawer.dart';

import '../Screens/doctors_screen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class HospitalsScreen extends StatelessWidget {
  static const routeName = '/Hospitals';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospitals'),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/appBg.jpg'), fit: BoxFit.cover)),
        padding: EdgeInsets.all(8),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('hospital')
                .orderBy('hospitalId')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final chatDocs = snapshot.data.docs;
              return Container(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: chatDocs.length,
                  itemBuilder: (ctx, i) => Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 20,
                    child: Column(children: [
                      Expanded(
                        child: GridTile(
                          footer: GridTileBar(
                            trailing: TextButton(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add_business_sharp,
                                    size: 27,
                                    color: Colors.indigoAccent[100],
                                  ),
                                  Text(
                                    'Read More',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all(
                                      Colors.indigoAccent[100])),
                              onPressed: () => Navigator.of(context).pushNamed(
                                  HospitalDetails.routeName,
                                  arguments:
                                      chatDocs[i].data()['hospitalTitle']),
                            ),
                            backgroundColor: Colors.black87,
                            title: Text(
                              chatDocs[i].data()['hospitalTitle'],
                              maxLines: 2,
                            ),
                          ),
                          child: Image.network(
                            chatDocs[i].data()['hospitalImg'],
                            fit: BoxFit.fill,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed(
                              DoctorsScreen.routeName,
                              arguments: chatDocs[i].data()['hospitalId']),
                          child: Card(
                            elevation: 0,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Tap here to see our Doctors',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                CircleAvatar(
                                  radius: 13,
                                  backgroundColor: Colors.indigo,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(10),
                ),
              );
            }),
      ),
      drawer: AppDrawer(),
    );
  }
}
