import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/layout/cubit/cubit.dart';
import 'package:social/layout/social_layout.dart';
import 'package:social/modules/login/cubit/cubit.dart';
import 'package:social/modules/login/login.dart';
import 'package:social/shared/cubit/states.dart';
import 'package:social/shared/network/local/cache_helper.dart';
import 'package:social/shared/network/remote/dio_helper.dart';
import 'modules/on_boarding/on_boarding_screen.dart';
import 'shared/cubit/cubit.dart';

void main() async {
  // عشان يتأكد ان كل حاجه المفروض تحصل قبل ما يرن لابلكيشن انها حصلت فعلا و خلصت
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await CacheHelper.init();

  Widget widget;

  bool onBoarding = CacheHelper.getData(key: 'onBoarding');

  // String token = CacheHelper.getData(key: 'token');

  //token = CacheHelper.getData(key: 'token');
  var uId = CacheHelper.getData(key: 'uId');
  print(uId);

  if (onBoarding != null) {
    if (uId != null)
      widget = SocialLayout();
    else
      widget = login();
  } else {
    widget = OnBoardingScreen();
  }

  runApp(
    MyApp(
      startWidget: widget,
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp({
    this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    DioHelper.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => SocialCubit()
            ..getUserData()
            ..getPosts(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                color: Colors.white,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                textTheme: TextTheme(
                  title: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
              ),
              textTheme: TextTheme(
                  subtitle1: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      height: 1.3)),
              //primarySwatch: Colors.orange,
              fontFamily: 'jannah',
              //visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: startWidget,
            //ShopLayout(),
          );
        },
      ),
    );
  }
}
