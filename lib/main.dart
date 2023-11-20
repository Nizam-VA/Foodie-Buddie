import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:foodiebuddie/controller/blocs/category/category_bloc.dart';
import 'package:foodiebuddie/controller/blocs/dish/dish_bloc.dart';
import 'package:foodiebuddie/controller/blocs/login/login_bloc.dart';
import 'package:foodiebuddie/controller/blocs/sign_up/sign_up_bloc.dart';
import 'package:foodiebuddie/view/screen/splash/screen_splash.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavigationBloc()),
        BlocProvider(create: (context) => SignUpBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => CategoryBloc()),
        BlocProvider(create: (context) => DishBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.urbanist().fontFamily,
          primarySwatch: Colors.green,
        ),
        home: const ScreenSplash(),
      ),
    );
  }
}
