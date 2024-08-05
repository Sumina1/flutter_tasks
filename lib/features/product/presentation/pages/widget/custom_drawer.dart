import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(10,30, 10, 10),
        children: <Widget>[
           Container(
            height: 120,
            
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(''), // Replace this with your own image
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Product Listo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.8),
                        blurRadius: 4.0,
                        offset: const Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
         
          // CustomListTile(
          //   icon: Icons.home,
          //   title: 'Home',
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
          const Divider(thickness: 1.5),
         
          // CustomListTile(
          //   icon: Icons.shopping_cart,
          //   title: 'Shop',
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
        const Divider(thickness: 1.5),
        //   CustomListTile(
        //     icon: Icons.favorite,
        //     title: 'Favorites',
        //     onTap: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        //   const Divider(thickness: 1.5),
        //   CustomListTile(
        //     icon: Icons.account_circle,
        //     title: 'Profile',
        //     onTap: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        // const Divider(thickness: 1.5),
        //   CustomListTile(
        //     icon: Icons.settings,
        //     title: 'Settings',
        //     onTap: () {
        //       Navigator.pop(context);
        //     },
        //   ),
      const Divider(thickness: 1.5),
        ],
      ),
    );
  }
}
