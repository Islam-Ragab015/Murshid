import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murshid/core/functions/custom_toast.dart';
import 'package:murshid/core/widgets/custom_shimmer_category.dart';
import 'package:murshid/features/home/presentation/cubit/home_cubit.dart';
import 'package:murshid/features/home/presentation/cubit/home_state.dart';
import 'package:murshid/core/widgets/custom_data_list_view.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetHistoricalPeriodsFailure) {
          showToast(state.errmessage);
        }
      },
      builder: (context, state) {
        return state is GetHistoricalPeriodsLoading
            ? const CustomShimmerCategory()
            : CustomDataListView(
                dataList: context.read<HomeCubit>().historicalPeriodsList,
              );
      },
    );
  }
}
