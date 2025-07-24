import 'package:flutter/material.dart';

class appBarIconButton extends StatelessWidget {
  const appBarIconButton({
    super.key,
    required this.onTap,
    required this.iconData,
  });

  final VoidCallback onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: CircleAvatar(
          radius: 16,
          backgroundColor: Colors.grey.shade200,
          child: Icon(
            iconData,
            size: 18,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
