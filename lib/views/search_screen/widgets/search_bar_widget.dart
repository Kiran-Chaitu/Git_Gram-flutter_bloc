import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/search/bloc/search_bloc.dart';

class SearchBarWidget extends StatefulWidget {
  final FocusNode focusNode;
  final TextEditingController userController;
  const SearchBarWidget(
      {super.key, required this.focusNode, required this.userController});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  Future<void> onSearch() async {
    if (widget.userController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a username")),
      );
      return;
    }
    context.read<SearchBloc>().add(
          SearchButton(userName: widget.userController.text.trim()),
        );
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: widget.focusNode,
      onKeyEvent: (KeyEvent event) async {
        if (event.runtimeType == KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.enter) {
          debugPrint('Enter key Pressed');
          await onSearch();
        }
      },
      child: TextField(
        textInputAction: TextInputAction.done,
        onSubmitted: (value) async {
          await onSearch();
        },
        controller: widget.userController,
        decoration: InputDecoration(
          hintText: "Enter UserName...",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }
}
