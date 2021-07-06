import 'package:flutter/foundation.dart';

class ArticlesData {
  final String articleId;
  final String articleTitle;
  final String articleData;
  final String imageUrl;

  const ArticlesData(
      {@required this.articleId,
      @required this.articleTitle,
      @required this.articleData,
      @required this.imageUrl});
}
