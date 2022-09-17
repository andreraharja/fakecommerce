import 'package:fakecommerce/view/homepage/homepage_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green,
          appBarTheme: const AppBarTheme(color: Colors.green)),
      debugShowCheckedModeBanner: false,
      title: 'FakeCommmerce',
      home: HomePage(),
    );
  }
}
