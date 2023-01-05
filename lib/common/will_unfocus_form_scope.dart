import 'package:flutter/material.dart';

class WillUnfocusedFormScope extends StatelessWidget {
  const WillUnfocusedFormScope({
    Key? key,
    required this.child,
    this.willUnfocusedCallback,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? willUnfocusedCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        willUnfocusedCallback?.call();
      },
      child: child,
    );
  }
}
