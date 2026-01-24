import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rishta_app/screens/dashboard/dashboard_page.dart';
import 'package:rishta_app/screens/dashboard/provider/provider.dart';
import 'package:rishta_app/screens/splash_screen/splash_screen.dart';

import 'screens/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DashboardProvider())],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(debugShowCheckedModeBanner: false, home: child);
        },

        // child: SplashScreen(),
        child: HomePage(),
      ),
    );
  }
}
