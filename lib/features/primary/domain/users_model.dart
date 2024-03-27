class UserModel {
  String location;
  int phone;
  String fullName;
  String email;
  String pass;
  String googleLoc;
  String gender;
  String dob;
  bool drive;
  String image;
  String id;

  UserModel({
    required this.location,
    required this.phone,
    required this.fullName,
    required this.email,
    required this.pass,
    required this.googleLoc,
    required this.gender,
    required this.dob,
    required this.drive,
    required this.image,
    required this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      location: json['location'],
      phone: json['phone'],
      fullName: json['full_name'],
      email: json['email'],
      pass: json['pass'],
      googleLoc: json['google_loc'],
      gender: json['gender'],
      dob: json['dob'],
      drive: json['drive'],
      image: json['image'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location,
      'phone': phone,
      'full_name': fullName,
      'email': email,
      'pass': pass,
      'google_loc': googleLoc,
      'gender': gender,
      'dob': dob,
      'drive': drive,
      'image': image,
      'id': id,
    };
  }
}