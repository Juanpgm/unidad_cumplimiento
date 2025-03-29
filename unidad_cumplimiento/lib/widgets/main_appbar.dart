import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onMenuPressed;

  const MainAppBar({
    super.key,
    required this.title,
    required this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, 
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white, 
          fontWeight: FontWeight.bold)),
      backgroundColor: const Color.fromARGB(255, 5, 46, 80),
      leading: IconButton(
        icon: const Icon(Icons.menu, 
          color: Colors.white,),
        onPressed: onMenuPressed,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

