// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:new_web_assesment/app_theme/app_colors.dart';
import 'package:new_web_assesment/app_theme/app_text_styles.dart';

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
            child: Text('KRO',
                style:
                    AppTextStyles.heading06Bold.copyWith(color: Colors.white)),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard, color: Colors.white),
            title: Text('Dashboard',
                style: AppTextStyles.paragraph03Bold
                    .copyWith(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.attach_money, color: Colors.white),
            title: Text('Accounts',
                style: AppTextStyles.paragraph03Bold
                    .copyWith(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.store, color: Colors.white),
            title: Text('Store',
                style: AppTextStyles.paragraph03Bold
                    .copyWith(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title: Text('Settings',
                style: AppTextStyles.paragraph03Bold
                    .copyWith(color: Colors.white)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
