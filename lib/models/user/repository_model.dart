import 'package:equatable/equatable.dart';

class RepositoryModel extends Equatable {
  final String name;
  final String htmlUrl;
  final String updatedAt;

  const RepositoryModel({
    this.name = '',
    this.htmlUrl = '',
    this.updatedAt = '',
  });

  RepositoryModel copyWith({
    String? name,
    String? htmlUrl,
    String? updatedAt,
  }) {
    return RepositoryModel(
      name: name ?? this.name,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [name, htmlUrl, updatedAt];

  
  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
      name: json['name'] ?? '',
      htmlUrl: json['html_url'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'html_url': htmlUrl,
      'updated_at': updatedAt,
    };
  }
}
