import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_gram/config/Routes/route_names.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../bloc/search/bloc/search_bloc.dart';
import '../../../utils/enums.dart';

class SearchButtonWidget extends StatefulWidget {
  final double height;
  final double width;
  final TextEditingController userController;
  const SearchButtonWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.userController});

  @override
  State<SearchButtonWidget> createState() => _SearchButtonWidgetState();
}

class _SearchButtonWidgetState extends State<SearchButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state.serchStatus == Status.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.userApiResponse.message ?? 'Error occurred',
              ),
              behavior: SnackBarBehavior.floating,
            ),
          );
        } else if (state.serchStatus == Status.success) {
          Navigator.pushNamed(context, RouteNames.userScreen, arguments: {
            'user': state.userApiResponse.data,
            'repos': state.userReposResponse.data
          });
        }
      },
      builder: (context, state) {
        return Visibility(
          visible: state.serchStatus != Status.loading,
          replacement: LoadingAnimationWidget.horizontalRotatingDots(
            color: Colors.black,
            size: 50,
          ),
          child: GestureDetector(
            onTap: () async {
              if (widget.userController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Please enter a username"),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                return;
              }
             
              context.read<SearchBloc>().add(
                    SearchButton(userName: widget.userController.text.trim()),
                  );
            },
            child: Container(
              height: widget.height * 0.06,
              width: widget.width * 0.35,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(36),
              ),
              child: Padding(
                padding: EdgeInsets.all(widget.width * 0.022),
                child: Center(
                  child: FittedBox(
                    child: Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: widget.width * 0.05,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
