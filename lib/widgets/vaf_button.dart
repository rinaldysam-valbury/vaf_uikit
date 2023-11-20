// ignore_for_file: constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:vaf_uikit/constants/_index.dart';
import 'package:vaf_uikit/widgets/vaf_text.dart';

//
enum ButtonSize { L, M, S, XS }

enum ButtonVariant { solid, outline, ghost }

class VAFButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final Color? backgroundColor;
  final double? borderRadius;
  final Color? color;
  final double? elevation;
  final FontWeight? fontWeight;
  final bool? isLoading;
  final bool? isDisabled;
  final ButtonSize? size;
  final double? height;
  final double? width;
  final ButtonVariant? variant;

  const VAFButton({
    super.key,
    required this.label,
    this.onPressed,
    this.backgroundColor = VAFColors.AZURE,
    this.borderRadius = 20,
    this.color = Colors.white,
    this.elevation = 0,
    this.fontWeight = FontWeight.w600,
    this.isLoading = false,
    this.isDisabled = false,
    this.size = ButtonSize.L,
    this.height,
    this.width,
    this.variant = ButtonVariant.solid,
  });

  @override
  Widget build(BuildContext context) {
    double _getPaddingY() {
      switch (size) {
        case ButtonSize.L:
          return 16;
        case ButtonSize.XS:
          return 5;
        default:
          return 10;
      }
    }

    double _getFontSize() {
      switch (size) {
        case ButtonSize.M:
          return 14;
        case ButtonSize.S:
          return 12;
        case ButtonSize.XS:
          return 10;
        default:
          return 16;
      }
    }

    Color? _getBackgroundColor() {
      if (variant == null) return backgroundColor;
      switch (variant) {
        case ButtonVariant.solid:
          return backgroundColor;
        case ButtonVariant.outline:
          return Colors.white;
        case ButtonVariant.ghost:
          return Colors.transparent;
        default:
          return Colors.white;
      }
    }

    Color? _getBorderColor() {
      if (isDisabled! || isLoading!) return VAFColors.GREY_DISABLED;
      if (variant == ButtonVariant.ghost) return Colors.transparent;
      return backgroundColor;
    }

    return ElevatedButton(
      onPressed: (isLoading! || isDisabled!) == false ? onPressed : null,
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        padding: EdgeInsets.symmetric(vertical: _getPaddingY(), horizontal: 16),
        backgroundColor: _getBackgroundColor(),
        side: BorderSide(
          width: 1,
          color: _getBorderColor() ?? VAFColors.AZURE,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!)),
      ),
      child: isLoading == true
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: color,
              ),
            )
          : VAFText(
              label,
              color: color,
              fontSize: _getFontSize(),
              fontWeight: fontWeight,
              fontFamily: FontFamily.plusJakartaSans,
            ),
    );
  }
}
