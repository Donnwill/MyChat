import 'dart:convert';

class Requests {
  String userName;
  String profilePic;
  String phoneNumber;
  String uid;
  Requests({
    this.userName,
    this.profilePic,
    this.phoneNumber,
    this.uid,
  });

  Requests copyWith({
    String userName,
    String profilePic,
    String phoneNumber,
    String uid,
  }) {
    return Requests(
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

  factory Requests.fromMap(Map<String, dynamic> map) {
    return Requests(
      userName: map['userName'],
      profilePic: map['profilePic'],
      phoneNumber: map['phoneNumber'],
      uid: map['uid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Requests.fromJson(String source) => Requests.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Requests(userName: $userName, profilePic: $profilePic, phoneNumber: $phoneNumber, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Requests &&
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
