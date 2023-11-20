// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaf_uikit/constants/_index.dart';
import 'package:vaf_uikit/extensions/_index.dart';
import 'package:vaf_uikit/helper/measure_size.dart';
import 'package:vaf_uikit/widgets/vaf_button.dart';
import 'package:vaf_uikit/widgets/vaf_svg.dart';
import 'package:vaf_uikit/widgets/vaf_text.dart';

enum VAFBottomsheetModalAlignment { left, right, center }

class VAFBottomsheetModal {
  static void show({
    String? imagePath,
    Size? imageSize,
    String? titleText,
    Widget? widgetTitle,
    String? messageText,
    Widget? widgetMesssage,
    String? submitText,
    VoidCallback? onSubmitPressed,
    String? cancelText,
    VoidCallback? onCancelPressed,
    TextAlign textAlign = TextAlign.center,
    TextStyle? titleStyle,
    TextStyle? messageStyle,
  }) {
    double contentHeight = Get.height;
    double headerHeight = 36;
    Get.bottomSheet(
      StatefulBuilder(
        builder: (
          BuildContext context,
          StateSetter setState,
        ) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Get.mediaQuery.padding.top.heightBox,
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  width: Get.width,
                  child: Column(children: [
                    Center(child: _Divider()).h(headerHeight),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      height: contentHeight,
                      constraints: BoxConstraints(
                        maxHeight: Get.height -
                            Get.mediaQuery.padding.top -
                            headerHeight,
                      ),
                      child: MeasureSize(
                        onChange: (newHeight) {
                          setState(() {
                            contentHeight = newHeight.height;
                          });
                        },
                        child: Container(
                          color: Colors.white,
                          width: Get.width,
                          padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 8,
                            bottom: 8 + Get.mediaQuery.padding.bottom,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (imagePath != null && imagePath.isNotEmpty)
                                Container(
                                  alignment: Alignment.center,
                                  child: VAFSvg(
                                    imagePath,
                                    width: imageSize?.width ?? (Get.width / 2),
                                    height:
                                        imageSize?.height ?? (Get.width / 2),
                                  ),
                                ),
                              if (widgetTitle != null)
                                widgetTitle
                              else if (titleText != null &&
                                  titleText.isNotEmpty)
                                VAFText(
                                  titleText,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  textAlign: textAlign,
                                  fontStyle: titleStyle?.fontStyle,
                                ).w(double.infinity).pSymmetric(v: 8),
                              if (widgetMesssage != null)
                                widgetMesssage
                              else if (messageText != null &&
                                  messageText.isNotEmpty)
                                VAFText(
                                  messageText,
                                  fontSize: 14,
                                  textAlign: textAlign,
                                  fontStyle: messageStyle?.fontStyle,
                                ).pSymmetric(v: 8).w(double.infinity),
                              if ((cancelText != null &&
                                      cancelText.isNotEmpty) ||
                                  (submitText != null && submitText.isNotEmpty))
                                16.heightBox,
                              if (submitText != null && submitText.isNotEmpty)
                                VAFButton(
                                  isDisabled: onSubmitPressed == null,
                                  label: submitText,
                                  onPressed: () {
                                    Get.back();
                                    if (onSubmitPressed != null)
                                      onSubmitPressed();
                                  },
                                ).pSymmetric(v: 4).w(double.infinity),
                              if (cancelText != null && cancelText.isNotEmpty)
                                VAFButton(
                                  isDisabled: onCancelPressed == null,
                                  label: cancelText,
                                  backgroundColor: Colors.transparent,
                                  color: Colors.black38,
                                  onPressed: () {
                                    Get.back();
                                    if (onCancelPressed != null) {
                                      onCancelPressed();
                                    }
                                  },
                                ).pSymmetric(v: 4).w(double.infinity),
                            ],
                          ),
                        ),
                      ).scrollVertical(),
                    ),
                  ]),
                ),
              ]);
        },
      ),
      isScrollControlled: true,
      isDismissible: true,
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 134,
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      decoration: const BoxDecoration(
        color: VAFColors.GREY,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
