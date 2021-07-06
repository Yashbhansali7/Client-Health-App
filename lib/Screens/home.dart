import 'package:clienthealth/Screens/appoint_screen.dart';
import 'package:clienthealth/Screens/article_screen.dart';
import 'package:clienthealth/Screens/faq_screen.dart';
import 'package:clienthealth/Screens/hospital_screen.dart';
import 'package:clienthealth/Screens/medicine_screen.dart';
import 'package:clienthealth/Screens/reminder_screen.dart';
import 'package:clienthealth/Screens/report_screen.dart';
import 'package:clienthealth/Screens/review_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../Widgets/app_drawer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getwidget/getwidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../location/location_model.dart';
import '../Screens/doctors_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home';
  final List images = [
    'images/homeReport.jpg',
    'images/homeAppoint.jpg',
    'images/homeDoc.jpg',
    'images/homeMed.jpg',
  ];
  final List images2 = [
    'images/homeReminder.jpg',
    'images/homeReview.png',
    'images/homeArticle.png',
    'images/FAQ.png',
  ];
  final List texts = [
    'View and Store Your Reports and Bills',
    'Book Your Appoinment Online',
    'Find Doctors Near You',
    'Medicine Authenticity'
  ];
  final List texts2 = [
    'Add Dosage Reminders',
    'Read and Add User Reviews',
    'Read exclusive health related Articles',
    'Fequently Asked Questions'
  ];

  final Widget dropDown;
  HomeScreen(this.dropDown);
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
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
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
        actions: [
          dropDown,
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Entypo.feather,
              color: Colors.indigo,
            ),
            const Text(
              ' Client Health',
              style: const TextStyle(
                fontSize: 25,
                color: Colors.indigo,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blueGrey[50],
        elevation: 0,
      ),
      drawer: AppDrawer(),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/appBg.jpg'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 315,
                child: StreamBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final chatDocs = snapshot.data.docs;
                    return ListView.builder(
                        physics: new NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: 65),
                        itemCount: chatDocs.length,
                        itemBuilder: (context, i) {
                          final user = FirebaseAuth.instance.currentUser;
                          return chatDocs[i].data()['userId'] == user.uid
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 350,
                                      padding: const EdgeInsets.only(top: 18.0),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        color: Colors.indigoAccent,
                                        child: Stack(
                                            alignment:
                                                AlignmentDirectional.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20.0),
                                                      child: Text(
                                                        'Welcome',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 23,
                                                        ),
                                                      )),
                                                  Text(
                                                    chatDocs[i].data()[
                                                            'username'] +
                                                        ' !',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 23,
                                                    ),
                                                    softWrap: true,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top: 10),
                                                    width: 250,
                                                    child: Text(
                                                      'Let\'s check your health with us. Care with your health from now on to get more live better',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                      ),
                                                      softWrap: true,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  ElevatedButton.icon(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pushNamed(
                                                                DoctorsScreen
                                                                    .routeName,
                                                                arguments:
                                                                    hospitalId),
                                                    icon: Icon(Icons
                                                        .medical_services_rounded),
                                                    label:
                                                        Text('See Our Doctors'),
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .white),
                                                        foregroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .indigo)),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                              Positioned(
                                                top: 0,
                                                left: 280,
                                                child: GFAvatar(
                                                  radius: 30,
                                                  backgroundImage: NetworkImage(
                                                    chatDocs[i]
                                                        .data()['img_url'],
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(
                                  height: 0,
                                  width: 0,
                                );
                        });
                  },
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .snapshots(),
                ),
              ),
              SizedBox(
                height: 280,
                child: new StaggeredGridView.countBuilder(
                  physics: new NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  padding: EdgeInsets.only(right: 20, left: 20, bottom: 0),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int i) => i < 2
                      ? GestureDetector(
                          onTap: () {
                            if (i == 0) {
                              Navigator.of(context)
                                  .pushNamed(ReportsScreen.routeName);
                            } else if (i == 1) {
                              Navigator.of(context)
                                  .pushNamed(AppointScreen.routeName);
                            }
                          },
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: Colors.indigo,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 120,
                                  width: 150,
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Image.asset(
                                      images[i],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  //   width: 100,
                                  child: Text(
                                    texts[i],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            if (i == 2) {
                              Navigator.of(context)
                                  .pushNamed(HospitalsScreen.routeName);
                            } else if (i == 3) {
                              Navigator.of(context)
                                  .pushNamed(MedicineScreen.routeName);
                            }
                          },
                          child: Card(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: 110,
                                  child: Text(texts[i],
                                      softWrap: true,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                ),
                                Container(
                                  height: 55,
                                  width: 55,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      images[i],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            color: Colors.indigo,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                  staggeredTileBuilder: (int i) =>
                      new StaggeredTile.count(2, i < 2 ? 2 : 1),
                  mainAxisSpacing: 14.0,
                  crossAxisSpacing: 14.0,
                ),
              ),
              SizedBox(
                  height: 410,
                  child: GridView.builder(
                    physics: new NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 4, crossAxisCount: 1),
                    itemCount: 4,
                    padding: EdgeInsets.all(20),
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          if (i == 0) {
                            Navigator.of(context)
                                .pushNamed(RemindersScreen.routeName);
                          } else if (i == 1) {
                            Navigator.of(context)
                                .pushNamed(ReviewsScreen.routeName);
                          } else if (i == 2) {
                            Navigator.of(context)
                                .pushNamed(ArticlesScreen.routeName);
                          } else if (i == 3) {
                            Navigator.of(context)
                                .pushNamed(FAQScreen.routeName);
                          }
                        },
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Icon(Icons.star),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                width: 230,
                                child: Text(texts2[i],
                                    softWrap: true,
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Container(
                                height: 75,
                                width: 75,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    images2[i],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              )
                            ],
                          ),
                          color: Colors.blueGrey[50],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
