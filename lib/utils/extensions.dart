import 'package:arm_project/presentation/resources/app_strings.dart';
import 'package:arm_project/utils/enums.dart';


extension FuelLevelFunctions on FuelLevelEnum {
  String getString() {
    switch (this) {
      case FuelLevelEnum.high:
        return AppStrings.high;
      case FuelLevelEnum.medium:
        return AppStrings.medium;
      case FuelLevelEnum.low:
        return AppStrings.low;
      case FuelLevelEnum.empty:
         return AppStrings.empty;
    }
  }
  double getPercentage(){
        switch (this) {
      case FuelLevelEnum.high:
        return 100;
      case FuelLevelEnum.medium:
        return 66.6;
      case FuelLevelEnum.low:
        return 33.3;
          case FuelLevelEnum.empty:
        return 0.0;
    }
  }

}
