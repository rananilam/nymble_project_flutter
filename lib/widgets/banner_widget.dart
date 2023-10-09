import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  String? imagePath;
  final double curve_size;
  String top_title;
  String bottom_title;
  bool? isImage;

  BannerWidget(
      {super.key,
      this.imagePath,
      this.isImage,
      required this.curve_size,
      required this.top_title,
      required this.bottom_title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
           Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color:  isImage==true?null:Colors.lightBlueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
            child:  isImage==true?Card(
              elevation: 5,
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                imagePath.toString(),
                fit: BoxFit.fill,
              ),
            ):Container(),
                ),
          Positioned(
              top: 30,
              left: 15,
              child: Card(
                  color: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      top_title,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ))),
          Positioned(
              bottom: 30,
              left: 15,
              child: Card(
                  color: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      bottom_title,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )))
        ],
      ),
    );
  }
}
