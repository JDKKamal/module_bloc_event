import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_bloc_event/blocs/user/user_bloc.dart';
import 'package:module_bloc_event/screens/pages/problem_tick_page.dart';
import 'package:module_bloc_event/service/di/dependency_injection.dart';
import 'package:module_bloc_event/blocs/login/login_bloc.dart';
import 'blocs/brand/brand_bloc.dart';
import 'blocs/drawer/drawer_bloc.dart';
import 'blocs/problem/problem_bloc.dart';
import 'helpers/vars.dart';
import 'screens/pages/home_page.dart';
import 'screens/pages/login_page.dart';
import 'screens/pages/payment_option.dart';
import 'screens/pages/payment_option_cash_address.dart';

void main() {
  Injector.configure(Flavor.Network);
  runApp(StartApp());
}

class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
    );

    return BlocProvider(
        builder: (context) => UserBloc(),
        child: BlocProvider(
            builder: (context) => LoginBloc(),
            child: BlocProvider(
                builder: (context) => BrandBloc(),
                child: BlocProvider(
                    builder: (context) => DrawerBloc(),
                    child: BlocProvider(
                        builder: (context) => ProblemBloc(),
                        child: MaterialApp(
                            theme: ThemeData(
                                //buttonColor: Colors.white,
                                brightness: Brightness.light,
                                accentColor: Colors.deepOrange,
                                primaryColor: Colors.deepOrangeAccent,
                                primarySwatch: Colors.deepOrange,
                                fontFamily: quickFont),
                            initialRoute: '/',
                            debugShowCheckedModeBanner: false,
                            routes: <String, WidgetBuilder>{
                              '/': (context) => HomePage(),
                              '/homepage': (context) => HomePage(),
                              '/login': (context) => LoginPage(),
                              '/problemtickpage': (context) => ProblemTickPage(),
                              '/paymentoptionpage' : (context) => PaymentOptionPage(),
                              '/paymentoptioncashaddresspage' : (context) => PaymentOptionCashAddressPage()
                            }))))));
  }
}
