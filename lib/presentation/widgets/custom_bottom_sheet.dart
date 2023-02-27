import 'package:flutter/material.dart';

import '../resources/app_values.dart';
import '../resources/themes/app_colors.dart';

class CustomBottomSheet {
  static Future open({
    required BuildContext context,
    required List<Widget> children,
    required String titleText,
    bool dividedList = false,
  }) async {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _bottomSheetTitle(context, titleText),
                Padding(
                    padding: const EdgeInsets.only(
                      left: AppPadding.p12,
                      right: AppPadding.p12,
                      bottom: AppPadding.p8,
                      top: AppPadding.p8,
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      children: dividedList
                          ? ListTile.divideTiles(
                                  context: context, tiles: children)
                              .toList()
                          : children,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _bottomSheetTitle(BuildContext context, String title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ),
            )
          ],
        ),
        const Divider(
          color: AppColors.grey,
        ),
      ],
    );
  }
}
