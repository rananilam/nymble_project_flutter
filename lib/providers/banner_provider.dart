import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

import '../model/data_model.dart';
import '../model/main_banner_model.dart';


class BannerProvider extends ChangeNotifier {

  PageController pageController = PageController();

  List<data_model> _data = [];
  main_banner_model? _model ;


  List<data_model> get data => _data;
  main_banner_model get model => _model!;


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
