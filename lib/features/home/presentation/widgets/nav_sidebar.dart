// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:new_web_assesment/app_theme/app_colors.dart';

class NavigationSidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: PrimaryColorsOne.primaryOne600,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'KRO',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard, color: Colors.white),
            title:
                const Text('Dashboard', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.attach_money, color: Colors.white),
            title: const Text('Loans', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.store, color: Colors.white),
            title: const Text('Store', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title:
                Text('Settings', style: const TextStyle(color: Colors.white)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
