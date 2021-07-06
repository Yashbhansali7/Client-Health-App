import 'package:flutter/material.dart';

class ArticleDetail extends StatelessWidget {
  final String aId;
  final String aTitle;
  final String aData;
  final String aImg;
  ArticleDetail(this.aId, this.aTitle, this.aData, this.aImg);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          aId,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              child: Image.network(aImg),
            ),
            Card(
              child: Text(aTitle),
            ),
            Card(
              child: Text(aData),
            ),
          ],
        ),
      ),
    );
  }
}
