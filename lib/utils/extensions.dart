import 'package:arm_project/presentation/resources/app_strings.dart';
import 'package:arm_project/utils/enums.dart';

extension DeviceStateFunctions on DeviceChnageState {
  String getString() {
    switch (this) {
      case DeviceChnageState.keep:
        return AppStrings.keep;
      case DeviceChnageState.autoTurnOn:
        return AppStrings.stateOn;
      case DeviceChnageState.autoTurnOff:
        return AppStrings.stateOff;
    }
  }
}
