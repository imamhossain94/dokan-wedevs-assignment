import 'package:dokan_wedevs_assignment/services/get_storage_service.dart';
import 'package:dokan_wedevs_assignment/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomFilterItemList extends StatefulWidget {
  final ValueChanged<String> onValueChanged;
  const CustomFilterItemList(
      {Key? key, required this.onValueChanged})
      : super(key: key);

  @override
  _CustomFilterItemListState createState() => _CustomFilterItemListState();
}

class _CustomFilterItemListState extends State<CustomFilterItemList> {

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = filterList.indexOf(getCheckedFilter());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filterList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return filterItem(
            title: filterList[index],
            value: selectedIndex == index?true:false,
            onValueChanged: (value) {
                setState(() {
                  selectedIndex = value;
                });
                setCheckedFilter(filterList[value]);
                widget.onValueChanged(filterList[value]);
            }
        );
      },
    );
  }

  Widget filterItem({required ValueChanged<int> onValueChanged, required String title, required bool value}){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: Checkbox(
              checkColor: Colors.white,
              activeColor: const Color(0xFFFF708A),
              side: const BorderSide(color: Color(0xFFFF708A), width: 2),
              value: value,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              onChanged: (bool? v) {
                onValueChanged(v!?filterList.indexOf(title):0);
              },
            ),
          ),
          const SizedBox(width: 12,),
          Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }


}
