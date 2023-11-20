import 'package:flutter/material.dart';

import 'package:vaf_uikit/constants/vaf_icons.dart';
import 'package:vaf_uikit/extensions/_index.dart';
import 'package:vaf_uikit/widgets/vaf_text.dart';

import 'vaf_svg.dart';

class VAFAppbar extends StatelessWidget implements PreferredSizeWidget {
  const VAFAppbar({
    super.key,
    this.withShadow = false,
    this.backIcon,
    this.onBackPress,
    this.title,
    this.titleWidget,
    this.child,
    this.actions,
    this.background = Colors.white,
  });

  final bool withShadow;
  final IconData? backIcon;
  final VoidCallback? onBackPress;
  final String? title;
  final Widget? titleWidget;
  final Widget? child;
  final Widget? actions;
  final Color background;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: withShadow ? Colors.black26 : Colors.transparent,
              blurRadius: 24,
            )
          ],
        ),
        child: AppBar(
          backgroundColor: background,
          leadingWidth: onBackPress != null ? 54 : 0,
          leading: onBackPress != null
              ? Row(children: [
                  if (onBackPress != null)
                    if (backIcon != null)
                      Icon(
                        backIcon,
                        color: Colors.amber,
                      )
                    else
                      Row(children: const [
                        VAFSvg(
                          VAFIcons.ICON_BACK,
                        )
                      ]),
                ]).pOnly(left: 16).onTap(() {
                  if (onBackPress != null) {
                    onBackPress!();
                  }
                })
              : const SizedBox(),
          elevation: 0.0,
          centerTitle: true,
          title: titleWidget ??
              (title != null && title != ''
                  ? VAFText(
                      title!,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )
                  : null),
          actions: [
            if (actions != null) actions!,
          ],
        ),
      ),
    );
  }
}
