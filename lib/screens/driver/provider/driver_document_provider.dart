import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:saqer_services/screens/driver/model/driver_document_model.dart';
import 'package:saqer_services/widgets/custom_snack_bar.dart';

class DriverDocumentProvider extends ChangeNotifier {
  //ref
  final CollectionReference collectionReference = FirebaseFirestore.instance
      .collection("drivers");

  String? get currentUser => FirebaseAuth.instance.currentUser?.uid;

  //storage
  Reference get storageRef => FirebaseStorage.instance.ref("drivers");
  //var
  DriverDocumentModel? _driverDocumentModel;

  DriverDocumentModel? get driverDocumentModel => _driverDocumentModel;
  //current user data
  DriverDocumentModel? _currentUserData;
  DriverDocumentModel? get currentUserData => _currentUserData;
  //loader
  bool _isLoader = false;
  bool get isLoader => _isLoader;

  void setLoader(bool value) {
    _isLoader = value;
    notifyListeners();
  }

  //upload shortcut functions

  Future<String> uploadFileInStorage({
    required File file,
    required String path,
  }) async {
    final Reference ref = storageRef.child(path);
    final TaskSnapshot task = await ref.putFile(file);
    final String downloadUrl = await task.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<bool> addDriverDetails({
    required BuildContext context,
    required String name,
    required String email,
    required String mobileNumber,
    required int age,
    required DateTime dob,
    required String address,
    required String city,
    required File driverImage,
    required File idCartImage,
    required File licenceImage,
    required File licenceBack,
    required String licenceNumber,
    required int yearsOfExperience,
    required Timestamp joinedAt,
    required String vehicleAutomationType,
  }) async {
    try {
      setLoader(true);
      //pick image and uplaod tasks to firebase
      //driver image
      final String driverImageUrl = await uploadFileInStorage(
        file: driverImage,
        path: "$name _$dob _$joinedAt/${driverImage.path}",
      );
      //driver details image
      final licenceBackImage = await uploadFileInStorage(
        file: licenceBack,
        path: "$name _$dob _$joinedAt/${licenceBack.path}",
      );
      //id cart image
      final idCartImageUrl = await uploadFileInStorage(
        file: idCartImage,
        path: "$name _$dob _$joinedAt/${idCartImage.path}",
      );
      //licence image
      final licenceImageUrl = await uploadFileInStorage(
        file: licenceImage,
        path: "$name _$dob _$joinedAt/${licenceImage.path}",
      );
      //to get document id
      final docRef = collectionReference.doc();

      //create driver model status will be pending
      final DriverDocumentModel documentModel = DriverDocumentModel(
        id: docRef.id,
        driverId: currentUser!,
        name: name,
        email: email,
        mobileNumber: int.parse(mobileNumber),
        age: age,
        dob: dob,
        address: address,
        city: city,
        driverImage: driverImageUrl,
        licenceBackImage: licenceBackImage,
        idCartImage: idCartImageUrl,
        licenceImage: licenceImageUrl,
        licenceNumber: licenceNumber,
        yearsOfExperience: yearsOfExperience,
        vehicleAutomationType: vehicleAutomationType,
        joinedAt: Timestamp.now(),
        status: "pending",
      );
      await docRef.set(documentModel.toMap());
      _currentUserData = documentModel;
      setLoader(false);
      notifyListeners();
      return true;
    } catch (e) {
      setLoader(false);
      if (context.mounted) {
        failedSnackBar(message: e.toString(), context: context);
      }
    }
    return false;
  }

  //get current user model for verification everytime
  Future<DriverDocumentModel> getCurrentUserData({
    required BuildContext context,
  }) async {
    try {
      final DocumentSnapshot docRef = await collectionReference
          .doc(currentUser!)
          .get();
      _currentUserData = DriverDocumentModel.fromMap(
        (docRef.data() as Map<String, dynamic>),
      );
      notifyListeners();
    } catch (e) {
      if (context.mounted) {
        failedSnackBar(message: e.toString(), context: context);
      }
    }
    return _currentUserData!;
  }
}
