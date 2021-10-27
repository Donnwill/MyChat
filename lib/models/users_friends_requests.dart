import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:my_chat/models/friends.dart';
import 'package:my_chat/models/requests.dart';

class UsersFriendsRequests {
  List<Friends> friends;
  List<Requests> requests;
  UsersFriendsRequests({
    this.friends,
    this.requests,
  });

  UsersFriendsRequests copyWith({
    List<Friends> friends,
    List<Requests> requests,
  }) {
    return UsersFriendsRequests(
      friends: friends ?? this.friends,
      requests: requests ?? this.requests,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'friends': friends?.map((x) => x.toMap())?.toList(),
      'requests': requests?.map((x) => x.toMap())?.toList(),
    };
  }

  factory UsersFriendsRequests.fromMap(Map<String, dynamic> map) {
    return UsersFriendsRequests(
      friends: List<Friends>.from(map['friends']?.map((x) => Friends.fromMap(x))),
      requests: List<Requests>.from(map['requests']?.map((x) => Requests.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory UsersFriendsRequests.fromJson(String source) => UsersFriendsRequests.fromMap(json.decode(source));

  @override
  String toString() => 'UsersFriendsRequests(friends: $friends, requests: $requests)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UsersFriendsRequests && listEquals(other.friends, friends) && listEquals(other.requests, requests);
  }

  @override
  int get hashCode => friends.hashCode ^ requests.hashCode;
}
