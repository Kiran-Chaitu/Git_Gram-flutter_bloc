import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_gram/bloc/search/bloc/search_bloc.dart';
import 'package:git_gram/config/Routes/route_names.dart';
import 'package:git_gram/config/Routes/routes.dart';
import 'package:git_gram/repository/user/user_api_repository.dart';

void main() {
  runApp(const MyCore());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.searchScreen,
      onGenerateRoute:Routes.generateRoute,
    );
  }
}

class MyCore extends StatelessWidget {
  const MyCore({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(userApiRepository: UserApiRepository()),
      child: MyApp(),
    );
  }
}
