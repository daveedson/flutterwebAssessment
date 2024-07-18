import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      title: Row(
        children: [
          const Text(
            'Dashboard',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.blue),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          const CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 8),
          const Text(
            'Hi, Chiamaka Uche',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          const Icon(Icons.arrow_drop_down, color: Colors.black),
        ],
      ),
    );
  }
}