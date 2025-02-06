import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? avatarUrl;
  final String? name;
  final String? userName;
  final int? publicRepos;
  final int? followersCount;
  final int? followingCount;
  const UserModel({
    this.avatarUrl = '',
    this.name = '',
    this.userName = '',
    this.publicRepos = 0,
    this.followersCount = 0,
    this.followingCount = 0,
  });

  UserModel copyWith({
    String? avatarUrl,
    String? name,
    String? userName,
    int? publicRepos,
    int? followersCount,
    int? followingCount,
  }) {
    return UserModel(
      avatarUrl: avatarUrl ?? this.avatarUrl,
      name: name ?? this.name,
      userName: userName ?? this.userName,
      publicRepos: publicRepos ?? this.publicRepos,
      followersCount: followersCount ?? this.followersCount,
      followingCount: followingCount ?? this.followingCount,
    );
  }

  @override
  List<Object?> get props => [
        avatarUrl,
        name,
        userName,
        publicRepos,
        followersCount,
        followingCount,
      ];
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      avatarUrl: json['avatar_url'] ?? '',
      name: json['name'] ?? '',
      userName: json['login'],
      publicRepos: json['public_repos'] ?? 0,
      followersCount: json['followersCount'] ?? 0,
      followingCount: json['followingCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatar_url'] = avatarUrl;
    data['name'] = name;
    data['login'] = userName;
    data['public_repos'] = publicRepos;
    data['followersCount'] = followersCount;
    data['followingCount'] = followingCount;
    return data;
  }
}
