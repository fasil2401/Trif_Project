import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/bottom_navigation/navigation.dart';
import 'package:trip_calicut/screens/home/homeinnerscreen.dart';
import 'package:trip_calicut/screens/home/homescreen.dart';
import 'package:trip_calicut/screens/homestay/homestayscreen.dart';
import 'package:trip_calicut/screens/houseboat/houseboatinnerscreen.dart';
import 'package:trip_calicut/screens/houseboat/houseboatscreen.dart';
import 'package:trip_calicut/screens/jobs/job_screen.dart';
import 'package:trip_calicut/screens/jobs/job_screen_inner.dart';
import 'package:trip_calicut/screens/login_screen/login_screen.dart';
import 'package:trip_calicut/screens/onboarding/onboarding.dart';
import 'package:trip_calicut/screens/resort/resortscreen.dart';
import 'package:trip_calicut/screens/singn_Up/signup.dart';
import 'package:trip_calicut/screens/splash_screen/splash_screen.dart';
import 'package:trip_calicut/screens/tours/tourscreen.dart';
import 'package:trip_calicut/screens/tours/tourscreen_inner.dart';
import 'package:trip_calicut/screens/travel/travelscreen.dart';
import 'package:trip_calicut/screens/trekking/trekkingscreen.dart';

const status = 'first_time';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: Colors.transparent, primary: Colors.blue),
        ),
        home: SplashScreen(),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => MyApp()),
          GetPage(name: '/bottomNav', page: () => App()),
          GetPage(name: '/home', page: () => HomeScreen()),
          GetPage(name: '/tour', page: () => TourScreen()),
          GetPage(name: '/travel', page: () => TravelScreen()),
          GetPage(name: '/trekking', page: () => TrekkingScreen()),
          GetPage(name: '/resort', page: () => ResortScreen()),
          GetPage(name: '/houseboat', page: () => HouseBoatScreen()),
          GetPage(name: '/homestay', page: () => HomeStayScreen()),
          GetPage(name: '/login', page: () => LoginScreen()),
          GetPage(name: '/onboarding', page: () => OnBoardingScreen()),
          GetPage(name: '/signup', page: () => SignUpScreen()),
          GetPage(name: '/singlepage', page: () => TourInnerScreen()),
          GetPage(name: '/jobsinglepage', page: () => JobInnerScreen()),
          GetPage(name: '/jobs', page: () => JobScreen()),
          GetPage(name: '/homesinglepage', page: () => HomeInnerScreen()),
          GetPage(name: '/houseboatsinglepage', page: () => HouseBoatInnerScreen()),
          
        ],
      );
    });
  }
}
