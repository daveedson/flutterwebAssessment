import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_web_assesment/features/home/presentation/widgets/custom_appbar.dart';
import 'package:new_web_assesment/features/home/presentation/widgets/nav_sidebar.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
       appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(),
      ),
      body: Row(
        children: [
          NavigationSidebar()
        ],
      ),
    );
  }
}