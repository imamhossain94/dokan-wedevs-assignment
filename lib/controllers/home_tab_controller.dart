import 'dart:convert';

import 'package:dokan_wedevs_assignment/models/products.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeTabController extends GetxController {

  var productLists = RxList<Product>();

  @override
  void onInit() {
    super.onInit();
    readJsonData();
  }


  Future<void> readJsonData() async {
    final String response = await rootBundle.loadString('assets/data/response.json');
    final dataJson = await json.decode(response);

    List<dynamic> dataList = dataJson != null ? List.from(dataJson) : [];

    List<Product> product = [];

    for(dynamic item in dataList){
      product.add(Product.fromJson(item));
    }

    productLists.value = product;
  }


}