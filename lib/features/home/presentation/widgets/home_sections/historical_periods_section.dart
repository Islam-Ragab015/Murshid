import 'package:flutter/material.dart';
import 'package:murshid/core/utils/app_strings.dart';
import 'package:murshid/core/widgets/custom_header_text.dart';
import 'package:murshid/features/home/presentation/widgets/historical_periods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class HistoricalPeriodsSection extends StatelessWidget {
  const HistoricalPeriodsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: firestore.collection(FireBaseStrings.historicalPeriods).get(),
        builder: (context, snapshot) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeaderText(
                text: AppStrings.historicalPeriods,
              ),
              SizedBox(
                height: 16,
              ),
              HistoricalPeriods(),
              SizedBox(
                height: 32,
              ),
            ],
          );
        });
  }
}
