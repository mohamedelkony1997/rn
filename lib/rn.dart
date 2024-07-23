import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rn/core/routing/app_router.dart';
import 'package:rn/core/routing/routes.dart';

class rn extends StatelessWidget {
  AppRouter router;
  rn({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context

      child: MaterialApp(
        title: "rn",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.employees,
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
