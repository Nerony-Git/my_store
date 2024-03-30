import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_store/utils/formats/formats.dart';

class AddressModel {
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String postalCode;
  final String county;
  final String country;
  final DateTime? dateTime;
  bool selectedAddress;

  /// Create address model constructor
  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.postalCode,
    required this.county,
    required this.country,
    this.dateTime,
    this.selectedAddress = true,
  });

  String get formattedPhoneNo => MyFormats.formatPhoneNumber(phoneNumber);

  /// Empty helper function
  static AddressModel empty() => AddressModel(
        id: '',
        name: '',
        phoneNumber: '',
        street: '',
        city: '',
        postalCode: '',
        county: '',
        country: '',
      );

  /// Convert model to json structure to store in firebase
  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'Name': name,
      'PhoneNumber': phoneNumber,
      'Street': street,
      'City': city,
      'PostalCode': postalCode,
      'County': county,
      'DateTime': DateTime.now(),
      'SelectedAddress': selectedAddress,
    };
  }

  /// Map json oriented document snapshot from firebase to address model
  factory AddressModel.fromMap(Map<String, dynamic> data) {
    return AddressModel(
      id: data['id'] as String,
      name: data['Name'] as String,
      phoneNumber: data['PhoneNumber'] as String,
      street: data['Street'] as String,
      city: data['City'] as String,
      postalCode: data['PostalCode'] as String,
      county: data['County'] as String,
      country: data['Country'] as String,
      selectedAddress: data['SelectedAddress'] as bool,
      dateTime: (data['DateTime'] as Timestamp).toDate(),
    );
  }

  /// Map json oriented document snapshot from firebase to address model
  factory AddressModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return AddressModel(
      id: snapshot.id,
      name: data['Name'] ?? '',
      phoneNumber: data['PhoneNumber'] ?? '',
      street: data['Street'] ?? '',
      city: data['City'] ?? '',
      postalCode: data['PostalCode'] ?? '',
      county: data['County'] ?? '',
      country: data['Country'] ?? '',
      selectedAddress: data['SelectedAddress'] as bool,
      dateTime: (data['DateTime'] as Timestamp).toDate(),
    );
  }

  @override
  String toString() {
    return '$street, $city, $county, $postalCode, $country';
  }
}
