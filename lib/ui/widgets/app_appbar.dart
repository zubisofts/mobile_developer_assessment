import 'package:flutter/material.dart';

class IAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final double? height;
  final Color? backgroundColor;
  const IAppBar(
      {super.key, this.title, this.actions, this.height, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      title: Text(
        title ?? "",
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}
