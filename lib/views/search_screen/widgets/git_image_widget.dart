import 'package:flutter/material.dart';

import '../../../utils/app_urls.dart';

class GitImageWidget extends StatefulWidget {
  final double width;
  const GitImageWidget({super.key , required this.width});

  @override
  State<GitImageWidget> createState() => _GitImageWidgetState();
}

class _GitImageWidgetState extends State<GitImageWidget> {
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: SizedBox(
          height: widget.width * 0.33,
          width: widget.width * 0.33,
          child: Image.network(
            AppUrls.gitImageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
