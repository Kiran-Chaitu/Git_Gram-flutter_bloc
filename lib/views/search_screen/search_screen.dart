import 'package:flutter/material.dart';
import 'package:git_gram/utils/extensions/general_extensions.dart';
import 'package:git_gram/views/search_screen/widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController userController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    userController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        final double height = context.mediaQueryHeight;
        final double width = context.mediaQueryWidth;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GitImageWidget(width: width),
            SizedBox(height: height * 0.01),
            Text(
              "GitGram",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: width * 0.07,
              ),
            ),
            SizedBox(height: height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: SearchBarWidget(
                focusNode: _focusNode,
                userController: userController,
              ),
            ),
            SizedBox(height: height * 0.04),
            SearchButtonWidget(
              height: height,
              width: width,
              userController: userController,
            ),
          ],
        );
      }),
    );
  }
}
