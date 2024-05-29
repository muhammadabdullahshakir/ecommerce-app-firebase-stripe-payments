import 'package:ecomapp/firebase_options.dart';
import 'package:ecomapp/screens/home.dart';
import 'package:ecomapp/screens/login.dart';
import 'package:ecomapp/utils/application_state.dart';
import 'package:ecomapp/utils/custom_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/checkout.dart';
import 'screens/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) =>
          Consumer<ApplicationState>(builder: (context, applicationState, _) {
            Widget child;
            switch (applicationState.loginState) {
              case ApplicationLoginState.loggedOut:
                child = LoginScreen();
                break;
              case ApplicationLoginState.loggedIn:
                child = MyApp();
                break;
              default:
                child = LoginScreen();
            }
            return MaterialApp(theme: CustomTheme.getTheme(), home: child);
          })));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("RungRosh"),
            shadowColor: Colors.black,
            elevation: 3,
            backgroundColor: Colors.white,
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
                boxShadow: CustomTheme.cardShadow),
            child: const TabBar(
                padding: EdgeInsets.symmetric(vertical: 0),
                indicatorColor: Colors.transparent,
                tabs: [
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(Icons.person)),
                  Tab(icon: Icon(Icons.shopping_cart)),
                ]),
          ),
          body: const TabBarView(
            children: [
              HomeScreen(),
              ProfileScreen(),
              CheckoutScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
