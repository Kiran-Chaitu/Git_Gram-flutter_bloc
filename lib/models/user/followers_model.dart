import 'package:equatable/equatable.dart';

class FollowersModel extends Equatable {
  final String name;
  final String userName;
  final String avatarUrl;

  const FollowersModel({
    this.name = '',
    this.userName = '',
    this.avatarUrl = '',
  });

  FollowersModel copyWith({
    String? name,
    String? userName,
    String? avatarUrl,
  }) {
    return FollowersModel(
      name: name ?? this.name,
      userName: userName ?? this.userName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  @override
  List<Object?> get props => [name, userName, avatarUrl];

  
  factory FollowersModel.fromJson(Map<String, dynamic> json) {
    return FollowersModel(
      name: json['name'] ?? '',
      userName: json['login'] ?? '',
      avatarUrl: json['avatar_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'login': userName,
      'avatar_url': avatarUrl,
    };
  }
}
