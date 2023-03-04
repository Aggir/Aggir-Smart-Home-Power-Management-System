import 'package:arm_project/data/models/history_model.dart';
import 'package:arm_project/presentation/resources/app_strings.dart';
import 'package:arm_project/presentation/resources/app_values.dart';
import 'package:arm_project/presentation/resources/themes/app_colors.dart';
import 'package:arm_project/presentation/resources/themes/decorations.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

class HistoryListItem extends StatelessWidget {
  const HistoryListItem(this.historyModel, {super.key});
  final HistoryModel historyModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppMargin.m8),
      decoration: BoxDecoration(
          boxShadow: AppDecorations.dropShadow,
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.secondary,
          radius: AppSize.s25,
          child: Text(_getPowerCutDuration()),
        ),
        title: Text(
          timeago.format(historyModel.from),
          style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'From: ${_getFormat(historyModel.from)}',
              style: const TextStyle(color: AppColors.mediumGrey),
            ),
            Text('To: ${_getFormat(historyModel.to)}',
                style: const TextStyle(color: AppColors.mediumGrey)),
          ],
        ),
      ),
    );
  }

  String _getFormat(DateTime? dateTime) {
    return dateTime != null
        ? DateFormat('yyyy/MM/dd - hh:mm a').format(dateTime)
        : AppStrings.now;
  }

  String _getPowerCutDuration() {
    Duration difference = const Duration();
    if (historyModel.to != null) {
      difference = historyModel.to!.difference(historyModel.from);
    } else {
      difference = DateTime.now().difference(historyModel.from);
    }

    if (difference.inSeconds >= 60) {
      if (difference.inMinutes >= 60) {
        return '${difference.inHours}h';
      } else {
        return '${difference.inMinutes}m';
      }
    } else {
      return '${difference.inSeconds}s';
    }
  }
}
