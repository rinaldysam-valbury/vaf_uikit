// ignore_for_file: camel_case_extensions, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension intExtension on int {
  Widget get heightBox => SizedBox(height: toDouble());
  Widget get widthBox => SizedBox(width: toDouble());
}

extension doubleExtension on double {
  Widget get heightBox => SizedBox(height: toDouble());
  Widget get widthBox => SizedBox(width: toDouble());
}

extension WidgetPadding on Widget {
  Widget pAll(double padding) => paddingAll(padding);

  Widget pSymmetric({double h = 0.0, double v = 0.0}) => paddingSymmetric(
        horizontal: h,
        vertical: v,
      );

  Widget pOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      paddingOnly(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      );
}

extension WidgetMargin on Widget {
  Widget mAll({double padding = 0.0}) => marginAll(padding);

  Widget mSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      marginSymmetric(
        horizontal: horizontal,
        vertical: vertical,
      );

  Widget mOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      marginOnly(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      );
}

extension WidgetExtensions on Widget {
  Widget h(double height) {
    return SizedBox(key: key, height: height, child: this);
  }

  Widget w(double width, {Key? key}) {
    return SizedBox(key: key, width: width, child: this);
  }

  Widget size(double height, double width, {Key? key}) {
    return Container(key: key, height: height, width: width);
  }

  Widget expanded({int flex = 1}) {
    return Expanded(flex: flex, child: this);
  }

  Widget scrollVertical({
    Key? key,
    ScrollController? controller,
    ScrollPhysics? physics,
    EdgeInsetsGeometry? padding,
  }) {
    return SingleChildScrollView(
      key: key,
      scrollDirection: Axis.vertical,
      controller: controller,
      physics: physics,
      padding: padding,
      child: this,
    );
  }

  Widget scrollHorizontal({
    Key? key,
    ScrollController? controller,
    ScrollPhysics? physics,
    EdgeInsetsGeometry? padding,
  }) {
    return SingleChildScrollView(
      key: key,
      scrollDirection: Axis.horizontal,
      controller: controller,
      physics: physics,
      padding: padding,
      child: this,
    );
  }

  Widget backgroundColor(Color color) {
    return Container(color: color, child: this);
  }
}

extension GestureDetectorExtensions on Widget {
  Widget onTap(GestureTapCallback onTap, {Key? key}) {
    return GestureDetector(key: key, onTap: onTap, child: this);
  }
}
