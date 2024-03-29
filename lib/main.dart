import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_sheet/global/my_router.dart';
import 'package:flutter_test_sheet/global/my_router_observer.dart';
import 'package:flutter_test_sheet/presentation/home_screen/home.dart';

void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test Sheet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings settings) =>
          MyRouter.generateRoute(settings),
      navigatorObservers: [MyRouterObserver()],
      home: const HomeScreen(),
    );
  }
}
