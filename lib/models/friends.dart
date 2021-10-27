import 'dart:convert';

class Friends {
  String userName;
  String profilePic;
  String phoneNumber;
  String userUid;
  Friends({
    this.userName,
    this.profilePic,
    this.phoneNumber,
    this.userUid,
  });

  Friends copyWith({
    String userName,
    String profilePic,
    String phoneNumber,
    String userUid,
  }) {
    return Friends(
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

  factory Friends.fromMap(Map<String, dynamic> map) {
    return Friends(
      userName: map['userName'],
      profilePic: map['profilePic'],
      phoneNumber: map['phoneNumber'],
      userUid: map['userUid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Friends.fromJson(String source) => Friends.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Friends(userName: $userName, profilePic: $profilePic, phoneNumber: $phoneNumber, userUid: $userUid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Friends &&
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
