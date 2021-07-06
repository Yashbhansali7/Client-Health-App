import '../Screens/articleDetailScreen.dart';

import 'package:flutter/material.dart';

class ArticlesAll extends StatelessWidget {
  final String id;
  final String data;
  final String title;
  final String imageUrl;

  ArticlesAll(this.id, this.data, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 10,
      child: GridTile(
        footer: Card(
          color: Colors.black54,
          child: GridTileBar(
            //  subtitle: Text('Tap To Read More It..'),
            trailing: TextButton(
              child: Row(
                children: [
                  Icon(
                    Icons.ac_unit,
                    size: 20,
                  ),
                  Text('  Read More')
                ],
              ),

              //icon: Icon(Icons.ac_unit),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.amber)),
              onPressed: () {},
            ),

            title: Text(
              title,
              maxLines: 3,

              //softWrap: true,
              //textAlign: TextAlign.center,
            ),
          ),
        ),
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ArticleDetail(id, title, data, imageUrl),
          )),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
