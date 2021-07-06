import '../Widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  static const routeName = '/FAQ(s)';

  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  int selectedIndex = 0;

  final List<String> faqHeader = [
    'APPOINTMENTS', //1
    'DOCTORS', //2
    'REPORTS', //3
    'REMINDERS', //4
    'FEEDBACK', //5
    'MY ACCOUNT', //6
    'MEDICINE', //7
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frequently Asked Questions'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Text(
              'Having Any Trouble??',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 40, 5),
            child: ListTile(
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                  Navigator.of(context)
                      .pushNamed('/FAQDisplay', arguments: selectedIndex);
                });
              },
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              title: Text(
                faqHeader[0],
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              tileColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 40, 5),
            child: ListTile(
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                  Navigator.of(context)
                      .pushNamed('/FAQDisplay', arguments: selectedIndex);
                });
              },
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              title: Text(
                faqHeader[1],
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              tileColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 40, 5),
            child: ListTile(
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                  Navigator.of(context)
                      .pushNamed('/FAQDisplay', arguments: selectedIndex);
                });
              },
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              title: Text(
                faqHeader[2],
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              tileColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 40, 5),
            child: ListTile(
              onTap: () {
                setState(() {
                  selectedIndex = 3;
                  Navigator.of(context)
                      .pushNamed('/FAQDisplay', arguments: selectedIndex);
                });
              },
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              title: Text(
                faqHeader[3],
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              tileColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 40, 5),
            child: ListTile(
              onTap: () {
                setState(() {
                  selectedIndex = 4;
                  Navigator.of(context)
                      .pushNamed('/FAQDisplay', arguments: selectedIndex);
                });
              },
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              title: Text(
                faqHeader[4],
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              tileColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 40, 5),
            child: ListTile(
              onTap: () {
                setState(() {
                  selectedIndex = 5;
                  Navigator.of(context)
                      .pushNamed('/FAQDisplay', arguments: selectedIndex);
                });
              },
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              title: Text(
                faqHeader[5],
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              tileColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 40, 5),
            child: ListTile(
              onTap: () {
                setState(() {
                  selectedIndex = 6;
                  Navigator.of(context)
                      .pushNamed('/FAQDisplay', arguments: selectedIndex);
                });
              },
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              title: Text(
                faqHeader[6],
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              tileColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
    );
  }
}
