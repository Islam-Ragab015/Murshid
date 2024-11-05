import 'package:flutter/material.dart';
import 'package:murshid/features/home/data/models/historical_periods_model.dart';
import 'package:murshid/features/home/presentation/widgets/home_sections/home_app_bar_section.dart';
import 'package:murshid/features/home/presentation/widgets/period_details_section.dart';

class HistoricalPeriodsDetailsView extends StatelessWidget {
  const HistoricalPeriodsDetailsView({super.key, required this.model});
  final HistoricalPeriodsModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: HomeAppBarSection()),
          const SliverToBoxAdapter(child: SizedBox(height: 7)),
          SliverToBoxAdapter(
              child: PeriodDetailsSection(
            periodName: model.name,
            description: model.description,
            imageUrl: model.image,
          )),
        ],
      ),
    ));
  }
}
