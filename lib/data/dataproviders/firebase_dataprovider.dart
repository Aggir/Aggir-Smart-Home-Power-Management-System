import 'package:arm_project/utils/constants.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseDataProvider {
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  Future<DatabaseReference> database() async {
    return _firebaseDatabase.ref();
  }

  void sendNotificationToken(String? token) {
    if (token != null) {
      //only one device
      _firebaseDatabase.ref().update({kToken: token});
    }
  }

  void updateGeneratorAutoStart(bool value) {
    _firebaseDatabase
        .ref()
        .child(kGeneratorAutoStart)
        .update({kAutoStart: value});
  }
  void updateLed1ElectricityAutoStart(bool value) {
    _firebaseDatabase
        .ref()
        .child(kLed1Auto)
        .update({kElectricity: value});
  }
  void updateLed1GeneratorAutoStart(bool value) {
    _firebaseDatabase
        .ref()
        .child(kLed1Auto)
        .update({kGenerator: value});
  }
  void switchLed1State(bool value){
     _firebaseDatabase
        .ref()
        .child(kLed1)
        .update({kState: value});
  }
  
}
