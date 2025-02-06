import 'package:flutter/material.dart';
import 'package:git_gram/models/user/repository_model.dart';
import 'package:git_gram/models/user/user_model.dart';

class UserScreen extends StatefulWidget {
  final UserModel user;
  final List<RepositoryModel> repos;
  const UserScreen({super.key, required this.user, required this.repos});
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${widget.user.userName}  ${widget.user.publicRepos}'),
      ),
    );
  }
}
