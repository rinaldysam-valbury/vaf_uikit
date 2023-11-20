import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vaf_uikit/extensions/_index.dart';
import 'package:vaf_uikit/widgets/vaf_text.dart';

class VAFEmptyState extends StatelessWidget {
  const VAFEmptyState({
    Key? key,
    this.image,
    required this.title,
    this.message,
  }) : super(key: key);

  final String? image;
  final String title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (image != null) SvgPicture.asset(image!).pSymmetric(v: 16),
        VAFText(
          title,
          textAlign: TextAlign.center,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        if (message != null && message != '')
          VAFText(
            message!,
            textAlign: TextAlign.center,
            fontSize: 16,
            height: 1.65,
          ).pSymmetric(v: 16),
      ],
    ).pSymmetric(h: 32, v: 32);
  }
}
