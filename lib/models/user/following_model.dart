import 'package:equatable/equatable.dart';

class FollowingModel extends Equatable {
  final String name;
  final String userName;
  final String avatarUrl;

  const FollowingModel({
    this.name = '',
    this.userName = '',
    this.avatarUrl = '',
  });

  FollowingModel copyWith({
    String? name,
    String? userName,
    String? avatarUrl,
  }) {
    return FollowingModel(
      name: name ?? this.name,
      userName: userName ?? this.userName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  @override
  List<Object?> get props => [name, userName, avatarUrl];

  
  factory FollowingModel.fromJson(Map<String, dynamic> json) {
    return FollowingModel(
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
