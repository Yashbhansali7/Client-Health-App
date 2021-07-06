import 'package:clienthealth/hotRestart.dart';
import 'package:clienthealth/location/location_model.dart';
import 'package:clienthealth/location/location_services.dart';
import './Screens/hospital_details.dart';
import './Screens/medicine_detail.dart';
import './Screens/medicine_cat_screen.dart';
import './Screens/appoint_add.dart';
import 'package:clienthealth/Screens/doc_details.dart';
import 'package:clienthealth/Screens/doctors_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'Screens/AuthScreen.dart';
import './Screens/review_add_screen.dart';
import './Providers/reviews.dart';
import 'package:provider/provider.dart';
import './Screens/faq_onAnySelected.dart';
import './Screens/home.dart';
import './Screens/appoint_screen.dart';
import './Screens/article_screen.dart';
import './Screens/faq_screen.dart';
import './Screens/hospital_screen.dart';
import './Screens/medicine_screen.dart';
import './Screens/reminder_screen.dart';
import './Screens/report_screen.dart';
import './Screens/review_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize();
  await Firebase.initializeApp();

  runApp(new HotRestartController(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Reviews(),
        ),
        StreamProvider<LocationModel>.value(
          value: LocationService().getStreamData(),
          initialData: LocationModel(latitude: 0, longitude: 0),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.indigo,
          accentColor: Colors.pinkAccent,
        ),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeScreen(DropDownButton());
            }
            return AuthScreen();
          },
        ),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(DropDownButton()),
          AppointScreen.routeName: (context) => AppointScreen(),
          AppointmentAdd.routeName: (context) => AppointmentAdd(),
          ArticlesScreen.routeName: (context) => ArticlesScreen(),
          FAQScreen.routeName: (context) => FAQScreen(),
          HospitalsScreen.routeName: (context) => HospitalsScreen(),
          MedicineScreen.routeName: (context) => MedicineScreen(),
          MedsCategory.routeName: (context) => MedsCategory(),
          MedsDetail.routeName: (context) => MedsDetail(),
          HospitalDetails.routeName: (context) => HospitalDetails(),
          RemindersScreen.routeName: (context) => RemindersScreen(),
          ReportsScreen.routeName: (context) => ReportsScreen(),
          ReviewsScreen.routeName: (context) => ReviewsScreen(),
          AddReview.routeName: (context) => AddReview(),
          FAQDisplay.routeName: (context) => FAQDisplay(),
          DocDetails.routeName: (context) => DocDetails(),
          DoctorsScreen.routeName: (context) => DoctorsScreen(),
        },
      ),
    );
  }
}

class DropDownButton extends StatelessWidget {
  const DropDownButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        items: [
          DropdownMenuItem(
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.indigo,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Logout')
                ],
              ),
            ),
            value: 'logout',
          )
        ],
        icon: Icon(
          Icons.more_vert,
          color: Colors.indigo,
        ),
        onChanged: (value) {
          FirebaseAuth.instance.signOut();
          HotRestartController.performHotRestart(context);
        });
  }
}
