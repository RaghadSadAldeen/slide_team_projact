import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showTitle;
  final bool showLeading;
  final bool showCustomMenuIcon;
  final Widget? leading;
  final List<Widget>? actions;
  final bool showActions;

  const CustomAppBar({
    super.key,
    this.title,
    this.showTitle = true,
    this.showLeading = true,
    this.showCustomMenuIcon = false,
    this.actions,
    this.leading,
    this.showActions = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      backgroundColor: const Color(0xFF1D3B2A),
      automaticallyImplyLeading: showLeading && !showCustomMenuIcon,
      title:
      showTitle && title != null
          ? Text(
        title!,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      )
          : null,
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
