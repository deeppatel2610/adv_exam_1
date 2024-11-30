import 'package:adv_exam_1/aip%20helper/api_helper.dart';
import 'package:adv_exam_1/model/stor_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  List<StorModel> mainList = [];
  bool isList = false;
  List<double> priceList = [];
  List<String> titleList = [];
  List<int> idList = [];
  double ans = 0;

  Future<List<StorModel>> apiCalling() async {
    List tempList = await ApiHelper.apiHelper.fetchApi();
    mainList = tempList
        .map(
          (e) => StorModel.fromJson(e),
        )
        .toList();
    return mainList;
  }

  void botton() {
    isList = !isList;
    notifyListeners();
  }

  void remove(int index) {
    priceList.removeAt(index);
    titleList.removeAt(index);
    idList.removeAt(index);
    notifyListeners();
  }

  void totel() {
    for (int i = 0; i < priceList.length; i++) {
      ans += priceList[i];
    }
    notifyListeners();
  }

  Future<void> set() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
  }
}

int tempIndex = 0;
