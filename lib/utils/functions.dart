import 'package:arm_project/presentation/resources/app_strings.dart';

int getWeekDayIndex(DateTime time) {
  if (time.weekday > 5) {
    return time.weekday - 5;
  }
  return time.weekday + 2;
}

String getState(bool state) {
  return state ? AppStrings.stateOn : AppStrings.stateOff;
}
