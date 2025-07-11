// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class DriverDocumentModel {
  //personal
  final String id;
  final String driverId;
  final String name;
  final String email;
  final int mobileNumber;
  final int age;
  final DateTime dob;
  final String address;
  final String city;
  //driver
  final String driverImage;
  final String licenceImage;
  final String licenceBackImage;
  final String idCartImage;
  final String licenceNumber;
  final int yearsOfExperience;
  final String vehicleAutomationType;
  final String status;
  final String? rejectedReason;
  final Timestamp? joinedAt;
  DriverDocumentModel({
    required this.id,
    required this.driverId,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.age,
    required this.dob,
    required this.address,
    required this.city,
    required this.driverImage,
    required this.idCartImage,
    required this.licenceImage,
    required this.licenceNumber,
    required this.yearsOfExperience,
    required this.vehicleAutomationType,
    required this.status,
    this.rejectedReason,
    required this.licenceBackImage,
    this.joinedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'driverId': driverId,
      'email': email,
      'mobileNumber': mobileNumber,
      'age': age,
      'dob': dob.millisecondsSinceEpoch,
      'address': address,
      'city': city,
      'driverImage': driverImage,
      'idCartImage': idCartImage,
      'licenceImage': licenceImage,
      'licenceNumber': licenceNumber,
      'yearsOfExperience': yearsOfExperience,
      'vehicleAutomationType': vehicleAutomationType,
      'status': status,
      'rejectedReason': rejectedReason,
      'driverDetailsImage': licenceBackImage,
      'joinedAt': joinedAt,
    };
  }

  factory DriverDocumentModel.fromMap(Map<String, dynamic> map) {
    return DriverDocumentModel(
      id: map['id'] as String,
      driverId: map['driverId'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      mobileNumber: map['mobileNumber'] as int,
      age: map['age'] as int,
      dob: DateTime.fromMillisecondsSinceEpoch(map['dob'] as int),
      address: map['address'] as String,
      city: map['city'] as String,
      driverImage: map['driverImage'] as String,
      idCartImage: map['idCartImage'] as String,
      licenceImage: map['licenceImage'] as String,
      licenceNumber: map['licenceNumber'] as String,
      yearsOfExperience: map['yearsOfExperience'] as int,
      vehicleAutomationType: map['vehicleAutomationType'] as String,
      status: map['status'] as String,
      rejectedReason: map['rejectedReason'] != null
          ? map['rejectedReason'] as String
          : null,
      licenceBackImage: map['licenceBackImage'] as String,
      joinedAt: map['joinedAt'] != null ? map['joinedAt'] as Timestamp : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DriverDocumentModel.fromJson(String source) =>
      DriverDocumentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
