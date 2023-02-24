import 'package:arm_project/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDataProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<CollectionReference> getMainData() async {
    return _firestore.collection(kMainData);
  }

}
