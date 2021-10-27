import 'dart:convert';

class Users {
  String userName;
  String email;
  String phoneNumber;
  String dateOfBirth;
  String profilePic;
 

  Users({
    this.userName,
    this.email,
    this.phoneNumber,
    this.dateOfBirth,
    this.profilePic,
  });

  Users copyWith({
    String userName,
    String email,
    String phoneNumber,
    String dateOfBirth,
    String profilePic,
  }) {
    return Users(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      profilePic: profilePic ?? this.profilePic,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth,
      'profilePic': profilePic,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      userName: map['userName'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      dateOfBirth: map['dateOfBirth'],
      profilePic: map['profilePic'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) => Users.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Users(userName: $userName, email: $email, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, profilePic: $profilePic)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Users &&
      other.userName == userName &&
      other.email == email &&
        other.phoneNumber == phoneNumber &&
      other.dateOfBirth == dateOfBirth &&
      other.profilePic == profilePic;
  }

  @override
  int get hashCode {
    return userName.hashCode ^
      email.hashCode ^ phoneNumber.hashCode ^ dateOfBirth.hashCode ^
      profilePic.hashCode;
  }
}
