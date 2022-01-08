import 'dart:convert';

import 'package:dokan_wedevs_assignment/models/products.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeTabController extends GetxController {
  var productLists = RxList<Product>().obs;

  var filterMethod = "Newest";

  @override
  void onInit() {
    super.onInit();
    readJsonData();
  }

  Future<void> readJsonData() async {
    final String response =
        await rootBundle.loadString('assets/data/response.json');
    final dataJson = await json.decode(response);

    List<dynamic> dataList = dataJson != null ? List.from(dataJson) : [];
    for (dynamic item in dataList) {
      productLists.value.add(Product.fromJson(item));
    }
  }


  void filterProduct() {
    switch (filterMethod) {
      case "Newest":
        // big > small
        productLists.value.sort((a, b) => b.dateModified!.compareTo(a.dateModified!));
        break;
      case "Oldest":
        // small > big
        productLists.value.sort((a, b) => a.dateModified!.compareTo(b.dateModified!));
        break;
      case "Price low > High":
        productLists.value.sort((a, b) => a.price!.compareTo(b.price!));
        break;
      case "Price high > Low":
        productLists.value.sort((a, b) => b.price!.compareTo(a.price!));
        break;
      case "Best selling":
        productLists.value.sort((a, b) => b.totalSales!.compareTo(a.totalSales!));
        break;
    }

    for(var x in productLists.value) {
      print(x.totalSales);
    }

  }


}
