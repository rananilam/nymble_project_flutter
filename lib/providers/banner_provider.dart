import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

import '../model/data_model.dart';
import '../model/main_banner_model.dart';


class BannerProvider extends ChangeNotifier {
  double _value = 1.0;
  int _currentPage = 0;
  PageController pageController = PageController();

  List<data_model> _data = [];
  main_banner_model? _model ;
  List onBoardingData = [
    {
      "image": "assets/images/screen1.png",
      "title": "Care your family",
      "description": "The process can include education new"
    },
    {
      "image": "assets/images/screen2.png",
      "title": "Act ahead of time",
      "description": "No holding back"
    },
    {
      "image": "assets/images/screen3.png",
      "title": "Go ahead.....!",
      "description": "See the world...."
    },
  ];

  double get value => _value;

  int get currentPage => _currentPage;
  List<data_model> get data => _data;
  main_banner_model get model => _model!;

  void changeValue(val) {
    _value = val;
    notifyListeners();
  }

  void onchanged(index) {
    _currentPage = index;
    notifyListeners();
  }

  Future<List<data_model>> readJsonData() async {
    final jsonData =
        await rootBundle.rootBundle.loadString("assets/json/banner_json.json");
    final list = json.decode(jsonData) as List<dynamic>;
    _data = list.map((e) => data_model.fromJson(e)).toList();
    notifyListeners();
    return _data;
  }
  Future<main_banner_model> readMainBannerJsonData() async {
    final jsonData =
        await rootBundle.rootBundle.loadString("assets/json/main_banner.json");
    final data = json.decode(jsonData);
    _model =  main_banner_model.fromJson(data);
    notifyListeners();
    return _model!;
  }
}
