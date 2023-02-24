import 'package:arm_project/data/dataproviders/firestore_dataprovider.dart';
import 'package:arm_project/data/models/device_model.dart';
import 'package:arm_project/data/models/electricity_model.dart';
import 'package:arm_project/data/models/generator_model.dart';
import 'package:arm_project/utils/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void getData() async {
    emit(HomeLoading());
    try {
      CollectionReference data = await FirestoreDataProvider().getMainData();
      late ElectricityModel electricityData;
      late GeneratorModel generatorData;
      late DeviceModel deviceData;
      data.snapshots().listen((event) {
        for (QueryDocumentSnapshot<Object?> doc in event.docs) {
          switch (doc.id) {
            case kElectricity:
              electricityData =
                  ElectricityModel.fromMap(doc.data() as Map<String, dynamic>);
              break;
            case kGenerator:
              generatorData =
                  GeneratorModel.fromMap(doc.data() as Map<String, dynamic>);
              break;
            case kLed1:
              deviceData =
                  DeviceModel.fromMap(doc.data() as Map<String, dynamic>);
              break;
            default:
          }
        }
        emit(HomeSuccess(
            electricityData: electricityData,
            generatorData: generatorData,
            deviceData: deviceData));
      });
    } catch (error) {
      emit(HomeFaliure());
    }
    
  }

  
}
