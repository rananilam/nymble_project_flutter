import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildCard2 extends StatelessWidget {
  final index;
  String? title;
  String? imagePath;

  BuildCard2({
    this.index,
    this.title,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  // "https://source.unsplash.com/random?sig=$index",
                  imagePath.toString(),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              //  child: Text('$index'),
              ),
              SizedBox(
                height: 10,
              ),
              title==null?Text('Card $index'):Text(title.toString())
            ],
          ),
        ),
      ),
    );
  }
}
