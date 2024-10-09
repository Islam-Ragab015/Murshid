import 'package:flutter/material.dart';
import 'package:murshid/features/home/presentation/widgets/home_sections/historical_charachter_section.dart';
import 'package:murshid/features/home/presentation/widgets/home_sections/historical_periods_section.dart';
import 'package:murshid/features/home/presentation/widgets/home_sections/historical_souvenirs_section.dart';
import 'package:murshid/features/home/presentation/widgets/home_sections/home_app_bar_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            //!  Home App Bar Section
            SliverToBoxAdapter(
              child: HomeAppBarSection(),
            ),
            //! Historical Periods Section
            SliverToBoxAdapter(
              child: HistoricalPeriodsSection(),
            ),
            //! Historical Charachter Section
            SliverToBoxAdapter(
              child: HistoricalCharachterSection(),
            ),
            //! Historical Souvenirs Section
            SliverToBoxAdapter(
              child: HistoricalSouvenirsSection(),
            ),
          ],
        ),
      ),
    );
  }
}
