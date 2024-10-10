import 'package:flutter/material.dart';
import 'package:murshid/core/utils/app_colors.dart';
import 'package:murshid/core/utils/app_text_styles.dart';
import 'package:murshid/features/home/data/models/historical_periods_model.dart';

class HistoricalPeriodItem extends StatelessWidget {
  const HistoricalPeriodItem({super.key, required this.model});
  final HistoricalPeriodsModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: 164,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: AppColors.grey,
                blurRadius: 8,
                offset: const Offset(5, 5))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 16,
          ),
          SizedBox(
            height: 47,
            width: 65,
            child: Text(
              model.name,
              style: CustomTextStyles.poppins500style18
                  .copyWith(fontSize: 16, color: AppColors.deepBrown),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Container(
            height: 64,
            width: 47,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(model.image),
            )),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
