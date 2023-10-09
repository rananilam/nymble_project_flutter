import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildCard extends StatelessWidget {
  final index;
  String? title;
  String? imagePath;

  BuildCard({
    this.index,
    this.title,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100))),
          color: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              // "https://source.unsplash.com/random?sig=$index",
              imagePath.toString(),
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            //  child: Text('$index'),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        title == null ? Text('Card $index') : Text(title.toString())
      ],
    );
  }
}
