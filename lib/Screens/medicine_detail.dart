import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MedsDetail extends StatelessWidget {
  static const routeName = '/MedicineDetail';
  @override
  Widget build(BuildContext context) {
    final String medName = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(medName.toString()),
      ),
      body: StreamBuilder(
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
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: Image.network(
                            chatDocs[index].data()['image_url'],
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chatDocs[index]
                                    .data()['medicineName']
                                    .toUpperCase(),
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                chatDocs[index]
                                    .data()['medicinePrice']
                                    .toUpperCase(),
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                              Divider(
                                thickness: 5,
                                color: Colors.grey,
                              ),
                              Text(
                                'Medicine Description',
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                              Card(
                                child: Text(
                                    chatDocs[index].data()['medicineDesc']),
                              )
                            ]),
                      )
                    ]);
              });
        },
        stream: FirebaseFirestore.instance
            .collection('medicine')
            .where('medicineName', isEqualTo: medName)
            .snapshots(),
      ),
    );
  }
}
