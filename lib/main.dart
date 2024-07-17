import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:new_web_assesment/app.dart';
import 'package:new_web_assesment/app_theme/app_themeing.dart';
import 'package:new_web_assesment/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // turn off the # in the URLs on the web
  usePathUrlStrategy();
  runApp( ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref) {
     final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'New Assesment',
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: AppTheme.getLight(),
      routerConfig: goRouter,
    );
  }
}
