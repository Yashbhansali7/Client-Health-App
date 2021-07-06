import '../Widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import '../Screens/medicine_cat_screen.dart';

class MedicineScreen extends StatelessWidget {
  static const routeName = '/Medicine';
  final List _icons = [
    Icons.add,
    Icons.ac_unit,
    Icons.access_alarm,
    Icons.accessibility,
    Icons.account_balance_wallet_rounded,
    Icons.zoom_out_sharp,
    Icons.face,
    Icons.all_inclusive
  ];
  final List _categories = [
    '1. Cough,Cold & Flu ',
    '2. Pain Relief',
    '3. Stomach Ache',
    '4. Indigestion & Heartburn ',
    '5. Multi -Vitamins',
    '6. Respiratory Problems',
    '7. Anti-Allergic',
    '8. COVID-19 medication'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(
          'Medicines',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/appBg.jpg'),
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
          ),
        ),
        child: GridView.builder(
          padding: EdgeInsets.fromLTRB(20, 90, 20, 0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.4),
          itemCount: 8,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () => Navigator.of(context)
                  .pushNamed(MedsCategory.routeName, arguments: i),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        _categories[i],
                      ),
                      Icon(_icons[i])
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
