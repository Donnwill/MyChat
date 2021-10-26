import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:my_chat/models/friends.dart';
import 'package:my_chat/models/requests.dart';

class Users {
  String userName;
  String email;
  String phoneNumber;
  String dateOfBirth;
  String profilePic;
  List<Friends> friends;
  List<Requests> requests;

  Users({
    this.userName,
    this.email,
    this.phoneNumber,
    this.dateOfBirth,
    this.profilePic,
    this.friends,
    this.requests,
  });

  Users copyWith({
    String userName,
    String email,
    String phoneNumber,
    String dateOfBirth,
    String profilePic,
    List<Friends> friends,
    List<Requests> requests,
  }) {
    return Users(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      profilePic: profilePic ?? this.profilePic,
      friends: friends ?? this.friends,
      requests: requests ?? this.requests,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth,
      'profilePic': profilePic,
      'friends': friends?.map((x) => x.toMap())?.toList(),
      'requests': requests?.map((x) => x.toMap())?.toList(),
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      userName: map['userName'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      dateOfBirth: map['dateOfBirth'],
      profilePic: map['profilePic'],
      friends: List<Friends>.from(map['friends']?.map((x) => Friends.fromMap(x))),
      requests: List<Requests>.from(map['requests']?.map((x) => Requests.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) => Users.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Users(userName: $userName, email: $email, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, profilePic: $profilePic, friends: $friends, requests: $requests)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Users &&
      other.userName == userName &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
      other.dateOfBirth == dateOfBirth &&
        other.profilePic == profilePic &&
        listEquals(other.friends, friends) &&
        listEquals(other.requests, requests);
  }

  @override
  int get hashCode {
    return userName.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        dateOfBirth.hashCode ^
        profilePic.hashCode ^
        friends.hashCode ^
        requests.hashCode;
  }
}
