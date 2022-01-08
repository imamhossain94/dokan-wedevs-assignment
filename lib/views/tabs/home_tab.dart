import 'package:dokan_wedevs_assignment/controllers/home_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key? key}) : super(key: key);

  final homeTabController = Get.put(HomeTabController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            AppBar(
              title: const Text(
                "Product List",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
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
                    icon: const Icon(
                      FontAwesomeIcons.search,
                      color: Colors.black,
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
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              height: 60,
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
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesomeIcons.filter,
                        size: 20,
                        color: Color(0xFFB6BED4),
                      ),
                      label: const Text(
                        "Filters",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: "Lato",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal),
                      )),
                  const Spacer(),
                  DropdownButton<String>(
                      value: "Sort by",
                      icon: const Icon(
                        FontAwesomeIcons.caretDown,
                        size: 28,
                        color: Color(0xFFB6BED4),
                      ),
                      //iconSize: 42,
                      underline: SizedBox(),
                      onChanged: (String? newValue) {},
                      items: <String>[
                        'Sort by',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: "Lato",
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal),
                          ),
                        );
                      }).toList()),
                  IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.tasks,
                      color: Colors.black,
                      size: 24,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            Expanded(
              //height: 500,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GetX<HomeTabController>(builder: (controller) {
                  return GridView.builder(
                    itemCount: controller.productLists.length,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (1 / 1.726),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
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
                                    controller.productLists[index].images[0].src!,
                                  fit: BoxFit.cover,
                                )
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            controller.productLists[index].name!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontFamily: "Roboto",
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        // Html(
                                        //     data: controller.productLists[index].priceHtml!
                                        // ),
                                        const SizedBox(height: 30,),

                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                  text: "\$${controller.productLists[index].regularPrice}",
                                                style: const TextStyle(
                                                    color: Color(0xFF989FA8),
                                                    decoration: TextDecoration.lineThrough,
                                                    fontSize: 18,
                                                    fontFamily: "Lato",
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.normal),
                                              ),
                                              WidgetSpan(
                                                  child: Container(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      "\$${controller.productLists[index].price}",
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontFamily: "Roboto",
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  )
                                              )

                                            ],
                                          ),
                                        )

                                      ],
                                    ),
                                  )
                              ),
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
