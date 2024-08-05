import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String) onSearchSubmitted;
  final Function(String) onSearchChanged;

  CustomAppBar({required this.onSearchSubmitted, required this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueAccent,
      title: Row(
        children: [
          Icon(Icons.store, color: Colors.white),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: onSearchChanged,
              onSubmitted: onSearchSubmitted,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search products...',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.filter_list, color: Colors.white),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
