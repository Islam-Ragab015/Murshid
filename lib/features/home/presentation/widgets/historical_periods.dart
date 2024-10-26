import 'package:flutter/material.dart';
import 'package:murshid/core/utils/app_strings.dart';
import 'package:murshid/core/widgets/custom_shimmer_category.dart';
import 'package:murshid/features/home/data/models/historical_periods_model.dart';
import 'package:murshid/features/home/presentation/widgets/historical_period_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:murshid/features/home/presentation/widgets/home_sections/historical_periods_section.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: firestore.collection(FireBaseStrings.historicalPeriods).get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
            return const Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            List<HistoricalPeriodsModel> historicalPeriods = [];
            for (var i = 0; i < snapshot.data!.docs.length; i++) {
              historicalPeriods.add(HistoricalPeriodsModel.fromJson(
                snapshot.data!.docs[i],
              ));
            }
            return SizedBox(
              height: 96,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.docs.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 10);
                },
                itemBuilder: (context, index) {
                  return HistoricalPeriodItem(
                    model: historicalPeriods[index],
                  );
                },
              ),
            );
          }

          return const CustomShimmerCategory();
        });
  }
}
