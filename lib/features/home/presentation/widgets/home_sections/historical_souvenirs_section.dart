import 'package:flutter/material.dart';
import 'package:murshid/core/utils/app_strings.dart';
import 'package:murshid/core/widgets/custom_header_text.dart';
import 'package:murshid/features/home/presentation/widgets/custom_category_list_view.dart';

class HistoricalSouvenirsSection extends StatelessWidget {
  const HistoricalSouvenirsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(
          text: AppStrings.historicalSouvenirs,
        ),
        SizedBox(
          height: 16,
        ),
        CustomCategoryListView(),
      ],
    );
  }
}
