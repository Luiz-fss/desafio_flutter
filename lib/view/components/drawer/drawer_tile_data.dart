import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  const DrawerTile({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(width: 16),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
