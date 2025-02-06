import 'package:flutter/material.dart';
import 'package:git_gram/config/Routes/route_names.dart';
import 'package:git_gram/views/follow_screen/follow_screen.dart';
import 'package:git_gram/views/views.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.userScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
            builder: (context) => UserScreen(
                  user: args?['user'],
                  repos: args?['repos'],
                ));
      case RouteNames.searchScreen:
        return MaterialPageRoute(builder: (context) => SearchScreen());
      case RouteNames.followScreen:
        return MaterialPageRoute(builder: (context) => FollowScreen());
      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(
              child: Text('No Route Found'),
            ),
          );
        });
    }
  }
}
