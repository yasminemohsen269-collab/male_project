import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:male_project/routing/router_generation_config.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  // DatabaseHelper databaseHelper = DatabaseHelper.instance;
  // await databaseHelper.insertMeal(
  //   Meal(
  //     imageUrl: AppAssets.onBourdingImage,
  //     title: "Burger",
  //     description: "delicious burger",
  //     time: "20-30",
  //     rate: 4.5,
  //   ),
  // );
  // databaseHelper.insertMeal(
  //   Meal(
  //     imageUrl: AppAssets.onBourdingImage,
  //     title: "Fries",
  //     description: "delicious Fries",
  //     time: "10-15",
  //     rate: 5,
  //   ),
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 860),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Meals App',
          routerConfig: RouterGenerationConfig.goRouter,
        );
      },
    );
  }
}
