import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nymble_project/providers/banner_provider.dart';
import 'package:nymble_project/widgets/banner_widget.dart';
import 'package:nymble_project/widgets/build_card.dart';
import 'package:nymble_project/widgets/build_card2.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BannerProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(child: Text("Nymble Project")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 220,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder(
                      future: provider.readMainBannerJsonData(),
                      builder: (context, data) {
                        if (data.hasError) {
                          return Text("Data Not Found");
                        } else if (data.hasData) {
                          var item = data.data;

                          return BannerWidget(
                            curve_size: 30,
                            imagePath: item!.image,
                            top_title: item!.headerText.toString(),
                            bottom_title: item!.footerText.toString(),
                            isImage:item.footerIcon
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Collections",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            ),
            Container(
              height: 210,
              child: FutureBuilder(
                  future: provider.readJsonData(),
                  builder: (context, data) {
                    if (data.hasError) {
                      return Text("Data Not Found");
                    } else if (data.hasData) {
                      var item = data.data;

                      return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(12),
                          itemBuilder: (context, index) {
                            return BuildCard(
                              // imagePath: "https://static2.bigstockphoto.com/4/9/2/large2/294566311.jpg",
                              imagePath: item![0].items![index].image,
                              index: index,
                              title: item![0].items![index].text,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 10,
                            );
                          },
                          itemCount: item![0].items!.length);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Cuisines",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            ),
            Container(
              height: 210,
              child: FutureBuilder(
                  future: provider.readJsonData(),
                  builder: (context, data) {
                    if (data.hasError) {
                      return Text("Data Not Found");
                    } else if (data.hasData) {
                      var item = data.data;
                      return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(12),
                          itemBuilder: (context, index) {
                            return BuildCard2(
                              imagePath: item![1].items![index].image,
                              index: index,
                              title: item![1].items![index].text,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 8,
                            );
                          },
                          itemCount: item![1].items!.length);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            // Container(
            //   height: 210,
            //   child: ListView.separated(
            //     scrollDirection: Axis.horizontal,
            //       padding: EdgeInsets.all(12),
            //       itemBuilder: (context, index) {
            //        return BuildCard(index: index);
            //       },
            //       separatorBuilder: (context, index) {
            //         return SizedBox(
            //           width: 10,
            //         );
            //       },
            //       itemCount: 10),
            // ),
          ],
        ),
      ),
    );
  }
}
