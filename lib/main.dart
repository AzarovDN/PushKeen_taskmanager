import 'package:flutter/material.dart';
import 'package:taskmanager/screens/main_screen.dart';
import 'package:taskmanager/controllers/task_controller.dart';
import 'package:get/get.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    primaryColorLight: const Color(0xffEBEBEB),
    primaryColorDark: const Color(0xff575767),
    scaffoldBackgroundColor: const Color(0xffFFFFFF),
    canvasColor: const Color(0xffF2F3FF),
    fontFamily: 'Inter',
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    textTheme: Theme.of(context).textTheme.apply(
          bodyColor: const Color(0xff000000),
          displayColor: const Color(0xff000000),
        ),
  );
}

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    primaryColorLight: const Color(0xff29292F),
    primaryColorDark: const Color(0xff575767),
    scaffoldBackgroundColor: const Color(0xff1E1F25),
    canvasColor: const Color(0xff24242D),
    fontFamily: 'Inter',
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),

    textTheme: Theme.of(context).textTheme.apply(
      bodyColor: const Color(0xffFFFFFF),
      displayColor: const Color(0xffFFFFFF),
    ),
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(TaskController());
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      themeMode: ThemeMode.system,
      home: const MainScreen(),
    );
  }
}
