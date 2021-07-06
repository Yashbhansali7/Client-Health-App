import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class ReviewList {
  final String rId;
  final String rData;

  final DateTime dateTime;
  ReviewList(
    this.rId,
    this.rData,
    this.dateTime,
  );
}

class Reviews with ChangeNotifier {
  List<ReviewList> _reviews = [];
  List<ReviewList> get reviews {
    return _reviews;
  }

  void addReview(ReviewList r) async {
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    FirebaseFirestore.instance.collection('reviews').add(({
          'reviewId': r.rId,
          'reviewData': r.rData,
          'reviewDate': r.dateTime,
          'reviewImg': userData.data()['img_url'],
        }));
    _reviews.insert(0, r);
    notifyListeners();
  }
}
