import 'package:arm_project/data/models/history_model.dart';
import 'package:arm_project/presentation/resources/app_strings.dart';
import 'package:arm_project/presentation/resources/app_values.dart';
import 'package:arm_project/presentation/screens/history/components/history_list_item.dart';
import 'package:arm_project/presentation/widgets/background_gradient.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<HistoryModel> historyData =
        (ModalRoute.of(context)!.settings.arguments as List<HistoryModel>)
            .reversed
            .toList();
    return BackgroundGradient(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.history),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(AppPadding.p8),
        itemBuilder: (context, index) => HistoryListItem(historyData[index]),
        itemCount: historyData.length,
      ),
    ));
  }
}
