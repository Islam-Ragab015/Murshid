import 'package:flutter/material.dart';
import 'package:murshid/core/utils/app_strings.dart';
import 'package:murshid/core/widgets/custom_header_text.dart';
import 'package:murshid/features/home/presentation/widgets/custom_category_list_view.dart';

class HistoricalCharachterSection extends StatelessWidget {
  const HistoricalCharachterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(
          text: AppStrings.historicalCharacters,
        ),
        SizedBox(
          height: 16,
        ),
        CustomCategoryListView(),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
