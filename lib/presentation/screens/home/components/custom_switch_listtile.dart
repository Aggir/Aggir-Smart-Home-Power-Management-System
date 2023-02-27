import 'package:flutter/material.dart';

import '../../../resources/themes/app_colors.dart';

class CustomSwitchListTile extends StatefulWidget {
  const CustomSwitchListTile(
      {super.key,
      required this.title,
      required this.value,
      required this.function});
  final String title;
  final bool value;
  final void Function(bool value) function;
  @override
  State<CustomSwitchListTile> createState() => _CustomSwitchListTileState();
}

class _CustomSwitchListTileState extends State<CustomSwitchListTile> {
  late bool value;
  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      inactiveTrackColor: AppColors.grey,
      value: value,
      onChanged: (newValue) {
        setState(() {
          value = newValue;
        });
        widget.function(newValue);
      },
      title: Text(widget.title, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
