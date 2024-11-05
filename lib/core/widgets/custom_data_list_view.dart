import 'package:flutter/material.dart';
import 'package:murshid/core/models/data_model.dart';
import 'package:murshid/core/widgets/custom_data_list_view_item.dart';

class CustomDataListView extends StatelessWidget {
  const CustomDataListView(
      {super.key, required this.dataList, required this.routPath});
  final List<DataModel> dataList;
  final String routPath;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dataList.length,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10);
        },
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          return CustomDataListViewItem(
            model: dataList[index],
            routPath: routPath,
          );
        },
      ),
    );
  }
}
