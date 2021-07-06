import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getwidget/getwidget.dart';
import '../Screens/medicine_detail.dart';

class MedsCategory extends StatelessWidget {
  static const routeName = '/MedicineCategory';
  @override
  Widget build(BuildContext context) {
    String catId;
    final int i = ModalRoute.of(context).settings.arguments;
    if (i == 0)
      catId = 'c01';
    else if (i == 1)
      catId = 'c02';
    else if (i == 2)
      catId = 'c03';
    else if (i == 3)
      catId = 'c04';
    else if (i == 4)
      catId = 'c05';
    else if (i == 5)
      catId = 'c06';
    else if (i == 6)
      catId = 'c07';
    else
      catId = 'c08';

    return Scaffold(
      appBar: AppBar(
        title: Text(i.toString()),
      ),
      body: Container(
        width: double.infinity,
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
            return ListView.builder(
                itemCount: chatDocs.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                        MedsDetail.routeName,
                        arguments: chatDocs[index].data()['medicineName']),
                    child: Card(
                      child: ListTile(
                        leading: GFAvatar(
                          backgroundColor: Colors.white,
                          shape: GFAvatarShape.standard,
                          child: Image.network(
                              chatDocs[index].data()['image_url']),
                        ),
                        title: Text(chatDocs[index].data()['medicineName']),
                      ),
                    ),
                  );
                });
          },
          stream: FirebaseFirestore.instance
              .collection('medicine')
              .where('categoryId', isEqualTo: catId.toString())
              .snapshots(),
        ),
      ),
    );
  }
}
