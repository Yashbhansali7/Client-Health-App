import 'package:clienthealth/Screens/home.dart';

import '../Screens/appoint_screen.dart';
import '../Screens/article_screen.dart';
import '../Screens/faq_screen.dart';
import '../Screens/hospital_screen.dart';
import '../Screens/medicine_screen.dart';
import '../Screens/reminder_screen.dart';
import '../Screens/report_screen.dart';
import '../Screens/review_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              title: Text('Hello Guyz!'),
              automaticallyImplyLeading: false,
            ),
            Divider(),
            ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName)),
            Divider(),
            ListTile(
                leading: Icon(Icons.spa_rounded),
                title: Text('Medicines'),
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(MedicineScreen.routeName)),
            Divider(),
            ListTile(
                leading: Icon(Icons.format_list_bulleted_sharp),
                title: Text('User Appointments'),
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(AppointScreen.routeName)),
            Divider(),
            ListTile(
                leading: Icon(Icons.receipt_outlined),
                title: Text('User Reports'),
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(ReportsScreen.routeName)),
            Divider(),
            ListTile(
                leading: Icon(Icons.local_hospital_rounded),
                title: Text('Hospitals'),
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(HospitalsScreen.routeName)),
            Divider(),
            ListTile(
                leading: Icon(Icons.timer),
                title: Text('Reminders'),
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(RemindersScreen.routeName)),
            Divider(),
            ListTile(
                leading: Icon(Icons.question_answer_rounded),
                title: Text('FAQs'),
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(FAQScreen.routeName)),
            Divider(),
            ListTile(
                leading: Icon(Icons.article),
                title: Text('Articles'),
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(ArticlesScreen.routeName)),
            Divider(),
            ListTile(
                leading: Icon(Icons.rate_review),
                title: Text('Reviews'),
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(ReviewsScreen.routeName)),
          ],
        ),
      ),
    );
  }
}
