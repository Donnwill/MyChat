import 'dart:convert';

class Requests {
  String userName;
  String profilePic;
  String phoneNumber;
  String userUid;
  Requests({
    this.userName,
    this.profilePic,
    this.phoneNumber,
    this.userUid,
  });

  Requests copyWith({
    String userName,
    String profilePic,
    String phoneNumber,
    String userUid,
  }) {
    return Requests(
      userName: userName ?? this.userName,
      profilePic: profilePic ?? this.profilePic,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userUid: userUid ?? this.userUid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'profilePic': profilePic,
      'phoneNumber': phoneNumber,
      'userUid': userUid,
    };
  }

  factory Requests.fromMap(Map<String, dynamic> map) {
    return Requests(
      userName: map['userName'],
      profilePic: map['profilePic'],
      phoneNumber: map['phoneNumber'],
      userUid: map['userUid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Requests.fromJson(String source) => Requests.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Requests(userName: $userName, profilePic: $profilePic, phoneNumber: $phoneNumber, userUid: $userUid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Requests &&
      other.userName == userName &&
        other.profilePic == profilePic &&
        other.phoneNumber == phoneNumber &&
      other.userUid == userUid;
  }

  @override
  int get hashCode {
    return userName.hashCode ^ profilePic.hashCode ^ phoneNumber.hashCode ^ userUid.hashCode;
  }
}
