
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_web_assesment/app_theme/app_text_styles.dart';
import 'package:new_web_assesment/app_theme/app_themeing.dart';
import 'package:new_web_assesment/routes/app_router.dart';


final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

    void showCustomSnackbar(String message) {
  scaffoldMessengerKey.currentState?.showSnackBar(
    
    SnackBar(content: Text(message,style:  AppTextStyles.paragraph01Medium.copyWith(color: Colors.white),),backgroundColor: Colors.green,),
  );
}
class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {

    final goRouter = ref.watch(goRouterProvider);
    return GestureDetector(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Booster',
        scaffoldMessengerKey: scaffoldMessengerKey,
        theme: AppTheme.getLight(),
        routerConfig: goRouter,
      ),
    );
  }
}
