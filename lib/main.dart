import 'package:flutter/material.dart';
import 'package:iit_app/screens/account.dart';
import 'package:iit_app/screens/council.dart';
import 'package:iit_app/screens/allWorkshops.dart';
import 'package:iit_app/screens/complaints.dart';
import 'package:iit_app/screens/home/home.dart';
import 'package:iit_app/screens/mess/mess.dart';
import 'package:iit_app/pages/login.dart';
import 'package:iit_app/screens/settings.dart';
import 'package:iit_app/screens/create.dart';
import 'package:iit_app/services/crud.dart';
import 'package:iit_app/screens/clubs.dart';
import 'package:iit_app/data/workshop.dart';

import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'data/post_api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool logStatus = await CrudMethods.isLoggedIn();
  print(logStatus);
  runApp(
    Provider(
      builder: (_) => PostApiService.create(),
      dispose: (_, PostApiService service) => service.client.dispose(),
      create: (BuildContext context) {  },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: logStatus
            ? HomeScreen()
            : LoginPage(), // route for home is '/' implicitly
        routes: <String, WidgetBuilder>{
          // define the routes
          '/home': (BuildContext context) => HomeScreen(),
          '/mess': (BuildContext context) => MessScreen(),
          '/allWorkshops': (BuildContext context) => AllWorkshopsScreen(),
          '/account': (BuildContext context) => AccountScreen(),
          '/council': (BuildContext context) => CouncilScreen(councilName: Workshop.councils[0],clubNames:Workshop.clubs[Workshop.councils[0]]),
          '/complaints': (BuildContext context) => ComplaintsScreen(),
          '/settings': (BuildContext context) => SettingsScreen(),
          '/club':(BuildContext context) => ClubScreen(),

          '/login': (BuildContext context) => LoginPage(),
          '/create': (BuildContext context) => CreateScreen(),
        },
      ),
    ),
  );
}
