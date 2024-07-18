import 'package:flutter/material.dart';
import 'package:new_web_assesment/app_theme/app_colors.dart';
import 'package:new_web_assesment/app_theme/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      title: Row(
        children: [
          Text('Dashboard',
              style:
                  AppTextStyles.paragraph03Bold.copyWith(color: Colors.black)),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.notifications, color:PrimaryColorsOne.primaryOne600),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          const CircleAvatar(
            backgroundColor: PrimaryColorsOne.primaryOne600,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Text('Hi, Chiamaka Uche',
              style:
                  AppTextStyles.paragraph03Bold.copyWith(color: Colors.grey)),
          const Icon(Icons.arrow_drop_down, color: Colors.black),
        ],
      ),
    );
  }
}
