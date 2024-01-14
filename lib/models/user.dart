

enum Roles {passenger, driver, admin}

class User {

  final String uid;
  final String email ;
  final String phoneNumber;
  final String icNumber ;
  final String password;
  // text about car information
  // final String carID;
  // final String carBrand;
  // final String carColor;

  // bool get isPassengerRole => role == Roles.passenger;
  // bool get isDriverRole => role == Roles.driver;
  // bool get isAdminRole => role == Roles.admin;

  const User({
    required this.uid,
    required this.email,
    required this.phoneNumber,
    required this.icNumber,
    required this.password,
    // required this.carID,
    // required this.carBrand,
    // required this.carColor
  });

}