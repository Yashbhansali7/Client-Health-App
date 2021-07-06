import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HospitalDetails extends StatelessWidget {
  static const routeName = '/HospitalDetails';
  @override
  Widget build(BuildContext context) {
    final String hospitalTitle = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(hospitalTitle),
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
                            chatDocs[index].data()['hospitalImg'],
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
                                    .data()['hospitalTitle']
                                    .toUpperCase(),
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                chatDocs[index]
                                    .data()['hospitalAddress']
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
                                    chatDocs[index].data()['hospitalDesc']),
                              )
                            ]),
                      )
                    ]);
              });
        },
        stream: FirebaseFirestore.instance
            .collection('hospital')
            .where('hospitalTitle', isEqualTo: hospitalTitle)
            .snapshots(),
      ),
    );
  }
}
