import 'dart:convert';

class Users {
  String userName;
  String email;
  String phoneNumber;
  String dateOfBirth;
  Users({
    this.userName,
    this.email,
    this.phoneNumber,
    this.dateOfBirth,
  });

  Users copyWith({
    String userName,
    String email,
    String phoneNumber,
    String dateOfBirth,
  }) {
    return Users(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      userName: map['userName'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      dateOfBirth: map['dateOfBirth'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) => Users.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Users(userName: $userName, email: $email, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Users &&
        other.userName == userName &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.dateOfBirth == dateOfBirth;
  }

  @override
  int get hashCode {
    return userName.hashCode ^ email.hashCode ^ phoneNumber.hashCode ^ dateOfBirth.hashCode;
  }
}
