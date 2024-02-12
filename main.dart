import 'package:flutter/material.dart';
import 'package:untitled1/business/auth/Register/register_cubit.dart';
import 'package:untitled1/business/auth/approve/approveaccount_cubit.dart';
import 'package:untitled1/business/deletetran/deletetran_cubit.dart';
import 'package:untitled1/business/mytran_cubit.dart';
import 'package:untitled1/const.dart';
import 'package:untitled1/model/sharedprefrence/cachhelper.dart';
import 'package:untitled1/model/user/userweb.dart';
import 'package:untitled1/view/auth/welcomescreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/view/inside/homescreen.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  UserWeb.init();

  await CachHelper.init();
  token = CachHelper.getData('token');
  // full_name=CachHelper.getData("full_name");
  // email=CachHelper.getData("email");
  userid=CachHelper.getData("userid");


  dynamic choosepage =token;
  late Widget start;
  if(token == null){
    start=WelcomeScreen();
  }

else
  start= HomeScreen();
  runApp( MyApp(start));
}

class MyApp extends StatelessWidget {

  Widget start;
  MyApp(this.start);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => ApproveaccountCubit(),
        ),
        BlocProvider(
          create: (context) => MytranCubit(),
        ),   BlocProvider(
          create: (context) => DeletetranCubit(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],

        supportedLocales: [
          const Locale('en'),
          const Locale('ar'),
        ],

        locale: const Locale('ar'),
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
        start,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

