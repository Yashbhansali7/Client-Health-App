import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DocDetails extends StatelessWidget {
  static const routeName = '/DocDetails';
  @override
  Widget build(BuildContext context) {
    final String docName = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(docName.toString()),
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
                            chatDocs[index].data()['docimageUrl'],
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
                                chatDocs[index].data()['docName'].toUpperCase(),
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                chatDocs[index]
                                    .data()['docTitle']
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
                                child: Text(chatDocs[index].data()['docSpec']),
                              )
                            ]),
                      )
                    ]);
              });
        },
        stream: FirebaseFirestore.instance
            .collection('doctor')
            .where('docName', isEqualTo: docName)
            .snapshots(),
      ),
    );
  }
}
