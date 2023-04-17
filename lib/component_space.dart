import 'package:flutter/material.dart';

class ComponentSpace extends StatelessWidget {
  final double? width;
  final double? height;

  const ComponentSpace({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
