import 'package:flutter/material.dart';
import 'package:murshid/features/home/data/models/historical_periods_model.dart';

class HistoricalPeriodsDetailsView extends StatelessWidget {
  const HistoricalPeriodsDetailsView({super.key, required this.model});
  final HistoricalPeriodsModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Historical Periods Details"),
      ),
    );
  }
}
