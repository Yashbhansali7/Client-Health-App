import '../Screens/review_add_screen.dart';

import 'package:intl/intl.dart';
import '../Widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getwidget/getwidget.dart';

class ReviewsScreen extends StatelessWidget {
  static const routeName = '/Reviews';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Reviews'),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
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
              itemBuilder: (ctx, i) {
                return Card(
                    child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    child: GFAvatar(
                      shape: GFAvatarShape.standard,
                      backgroundColor: Colors.white,
                      child: Image.network(chatDocs[i].data()['reviewImg']),
                      radius: 22,
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          chatDocs[i].data()['reviewId'],
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.blue[900],
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          DateFormat.MMMEd().format(
                            chatDocs[i].data()['reviewDate'].toDate(),
                          ),
                          style: TextStyle(fontSize: 15, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      chatDocs[i].data()['reviewData'],
                    ),
                  ),
                ));
              },
            );
          },
          stream: FirebaseFirestore.instance.collection('reviews').snapshots(),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed(AddReview.routeName),
          child: Icon(
            Icons.rate_review,
            size: 28,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      drawer: AppDrawer(),
    );
  }
}
