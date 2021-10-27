import 'dart:convert';

class Friends {
  String userName;
  String profilePic;
  String phoneNumber;
  String uid;
  Friends({
    this.userName,
    this.profilePic,
    this.phoneNumber,
    this.uid,
  });

  Friends copyWith({
    String userName,
    String profilePic,
    String phoneNumber,
    String uid,
  }) {
    return Friends(
      userName: userName ?? this.userName,
      profilePic: profilePic ?? this.profilePic,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'profilePic': profilePic,
      'phoneNumber': phoneNumber,
      'uid': uid,
    };
  }

  factory Friends.fromMap(Map<String, dynamic> map) {
    return Friends(
      userName: map['userName'],
      profilePic: map['profilePic'],
      phoneNumber: map['phoneNumber'],
      uid: map['uid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Friends.fromJson(String source) => Friends.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Friends(userName: $userName, profilePic: $profilePic, phoneNumber: $phoneNumber, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Friends &&
        other.userName == userName &&
        other.profilePic == profilePic &&
        other.phoneNumber == phoneNumber &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return userName.hashCode ^ profilePic.hashCode ^ phoneNumber.hashCode ^ uid.hashCode;
  }
}
