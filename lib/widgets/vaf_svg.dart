// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VAFSvg extends StatelessWidget {
  final String path;
  final bool isFromAssets;
  final BoxFit? fit;
  final double? height;
  final double? width;

  const VAFSvg(
    this.path, {
    Key? key,
    this.isFromAssets = true,
    this.fit = BoxFit.contain,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    if (isFromAssets) {
      return SvgPicture.asset(
        path,
        height: height,
        width: width,
        fit: fit ?? BoxFit.contain,
      );
    }

    return SvgPicture.network(
      path,
      height: height,
      width: width,
      fit: fit ?? BoxFit.contain,
    );
  }
}
