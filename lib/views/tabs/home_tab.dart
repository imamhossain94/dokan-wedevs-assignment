import 'package:dokan_wedevs_assignment/controllers/home_tab_controller.dart';
import 'package:dokan_wedevs_assignment/views/components/custom_filter_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key? key}) : super(key: key);

  final homeTabController = Get.put(HomeTabController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(10.h),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            AppBar(
              title: Text(
                "Product List",
                style: TextStyle(
                    color: const Color(0xFF222455),
                    fontSize: 18.sp,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.search,
                      color: Colors.black,
                      size: 16.sp,
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            )
          ]),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 7.w),
              height: 7.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ]),
              child: Row(
                children: [
                  TextButton.icon(
                      onPressed: () {

                        Get.bottomSheet(
                          Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFF8F8F8),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, bottom: 30),
                                          child: SizedBox(
                                            width: 50,
                                            child: Divider(
                                              height: 3,
                                              thickness: 3,
                                              color: Color(0xFFFFD3DD),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        "Filter",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                            fontFamily: "Roboto",
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      CustomFilterItemList(
                                        onValueChanged: (value) {
                                            homeTabController.filterMethod = value;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 60,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  side: const BorderSide(
                                                      width: 0.5,
                                                      color: Color(0xFFD2DBE0))),
                                              elevation: 0,
                                              child: SizedBox(
                                                  height: 60,
                                                  child: CupertinoButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      padding: EdgeInsets.zero,
                                                      child: const Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                            color:
                                                                Color(0xFF818995),
                                                            fontSize: 20,
                                                            fontFamily: "Roboto",
                                                            fontStyle:
                                                                FontStyle.normal,
                                                            fontWeight: FontWeight
                                                                .normal),
                                                      ),
                                                      color: Colors.white)),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                                height: 60,
                                                child: CupertinoButton(
                                                    onPressed: () {
                                                      homeTabController.filterProduct();
                                                      Get.back();
                                                    },
                                                    padding: EdgeInsets.zero,
                                                    child: const Text(
                                                      "Apply",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontFamily: "Lato",
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.normal),
                                                    ),
                                                    color:
                                                        const Color(0xFF1ABC9C))),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          isDismissible: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              topLeft: Radius.circular(8),
                            ),
                          ),
                          enableDrag: true,
                        );

                      },
                      icon: Icon(
                        FontAwesomeIcons.filter,
                        size: 14.sp,
                        color: const Color(0xFFB6BED4),
                      ),
                      label: Text(
                        "Filters",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontFamily: "Lato",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal),
                      )),
                  const Spacer(),
                  DropdownButton<String>(
                      value: "Sort by",
                      icon: Icon(
                        FontAwesomeIcons.caretDown,
                        size: 20.sp,
                        color: const Color(0xFFB6BED4),
                      ),
                      //iconSize: 42,
                      underline: const SizedBox(),
                      onChanged: (String? newValue) {},
                      items: <String>[
                        'Sort by',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontFamily: "Lato",
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal),
                          ),
                        );
                      }).toList()),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.tasks,
                      color: Colors.black,
                      size: 14.sp,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: GetX<HomeTabController>(builder: (controller) {
                  return GridView.builder(
                    itemCount: controller.productLists.value.length,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (1 / 1.726),
                      crossAxisSpacing: 3.w,
                      mainAxisSpacing: 3.w,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Image.network(
                                    controller.productLists.value[index]
                                        .images[0].src!,
                                    fit: BoxFit.cover,
                                  )),
                              const Divider(height: 0,),
                              Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(3.w, 1.h, 2.w, 1.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.productLists.value[index].name!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              fontFamily: "Roboto",
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        // Html(
                                        //     data: controller.productLists[index].priceHtml!
                                        // ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    "\$${controller.productLists.value[index].regularPrice}",
                                                style: TextStyle(
                                                    color: const Color(0xFF989FA8),
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    fontSize: 14.sp,
                                                    fontFamily: "Lato",
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              WidgetSpan(
                                                  child: Container(
                                                padding: EdgeInsets.only(left: 2.w),
                                                child: Text(
                                                  "\$${controller.productLists.value[index].price}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14.sp,
                                                      fontFamily: "Roboto",
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            child: RatingBarIndicator(
                                          direction: Axis.horizontal,
                                          rating: controller.productLists
                                              .value[index].ratingCount!
                                              .toDouble(),
                                          itemCount: 5,
                                          itemSize: 14.sp,
                                          itemPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 0),
                                          itemBuilder: (context, _) =>
                                              const FaIcon(
                                            FontAwesomeIcons.solidStar,
                                            color: Color(0xFFF5A623),
                                          ),
                                        )),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
