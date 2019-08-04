import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {

  final String imagePath;
  final double height;

  ImageBanner({@required this.imagePath, this.height = 200.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: height
      ),
      decoration: BoxDecoration(
        color: Colors.grey
      ),
      child: Image.asset(
          imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}