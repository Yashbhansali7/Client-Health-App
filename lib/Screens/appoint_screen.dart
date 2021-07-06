import 'package:clienthealth/Screens/doctors_screen.dart';
import 'package:clienthealth/location/location_model.dart';

import '../Widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getwidget/getwidget.dart';

class AppointScreen extends StatelessWidget {
  static const routeName = '/appoint';

  @override
  Widget build(BuildContext context) {
    var locationModel = Provider.of<LocationModel>(context);
    int curLat = locationModel.latitude.round();
    int curLong = locationModel.longitude.round();
    String hospitalId;
    if ((curLat == 18 || curLat == 19) && (curLong == 73 || curLong == 74))
      hospitalId = 'h1';
    else if ((curLat == 26 || curLat == 27) &&
        (curLong == 73 || curLong == 74 || curLong == 72))
      hospitalId = 'h2';
    else if ((curLat == 26 || curLat == 27) && (curLong == 76 || curLong == 77))
      hospitalId = 'h3';
    else if ((curLat == 21 || curLat == 22) && (curLong == 81 || curLong == 82))
      hospitalId = 'h4';
    else if (curLat == 26 && (curLong == 91 || curLong == 92))
      hospitalId = 'h5';
    else
      hospitalId = 'h1';
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: AppDrawer(),
      appBar: AppBar(
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
        title: Text(
          'Your Appointments', //
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
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
            final user = FirebaseAuth.instance.currentUser;
            return ListView.builder(
              padding: EdgeInsets.only(top: 80, right: 8, left: 8),
              itemCount: chatDocs.length,
              itemBuilder: (context, index) {
                return chatDocs[index].data()['userId'] == user.uid
                    ? Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19.0),
                        ),
                        child: ListTile(
                          minVerticalPadding: 10,
                          title: Text(
                            chatDocs[index].data()['appointDoc'],
                            style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 4),
                              Text(chatDocs[index].data()['appointDate'],
                                  style: TextStyle(
                                    fontSize: 16,
                                  )),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.access_alarm_rounded),
                                  Text(chatDocs[index].data()['appointTime'],
                                      style: TextStyle(
                                        fontSize: 16,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          leading: Container(
                            height: 80,
                            width: 60,
                            child: GFAvatar(
                              shape: GFAvatarShape.standard,
                              backgroundImage: NetworkImage(
                                  chatDocs[index].data()['docImg']),
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 30,
                            ),
                            onPressed: () async =>
                                await FirebaseFirestore.instance.runTransaction(
                                    (Transaction myTransaction) async {
                              myTransaction.delete(chatDocs[index].reference);
                            }),
                          ),
                        ),
                      )
                    : null;
              },
            );
          },
          stream:
              FirebaseFirestore.instance.collection('appointments').snapshots(),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          width: 240,
          margin: EdgeInsets.all(15),
          child: FloatingActionButton.extended(
            backgroundColor: Colors.deepPurple,
            label: Text(
              'Add Appnointment',
              style: TextStyle(fontSize: 16),
            ),
            icon: Icon(
              Icons.add,
              size: 35,
            ),
            onPressed: () => Navigator.of(context)
                .pushNamed(DoctorsScreen.routeName, arguments: hospitalId),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
