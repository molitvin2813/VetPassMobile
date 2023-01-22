
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Pages/MainPage/MainPage.dart';


import 'package:vet_pass/Redux/AppState.dart';

import 'Pages/AnimalPage/AnimalPage.dart';
import 'Pages/ChatMessagePage/ChatMessagePage.dart';
import 'Pages/LoginPage/LoginPage.dart';
import 'Pages/PrescriptionsListPage/PrescriptionsListPage.dart';
import 'Pages/SelectAnimalPage/SelectAnimalPage.dart';
import 'Redux/AppReducer.dart';
import 'package:flutter/services.dart';

import 'Variables/Constants.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }

  Route _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return _buildRoute(settings,  LoginPage());
      case '/selectAnimal':
        return _buildRoute(settings, const SelectAnimalPage());
      case '/animal':
        return _buildRoute(settings, const AnimalPage());
      case '/main' :
        return _buildRoute(settings,  MainPage());
      case '/chatMessage' :
        return _buildRoute(settings,  const ChatMessagePage());
      case '/prescriptionPage' :
        return _buildRoute(settings,   PrescriptionListPage());
      default:
        return _buildRoute(settings,  LoginPage());
    }
  }

  final Store<AppState> store = Store(reducer,
      initialState: const AppState.initialState(),
      middleware: [
        const NavigationMiddleware<AppState>(),
      ]
  );

    runApp(
      StoreProvider(
        store: store,
        child:
        MaterialApp(
          scaffoldMessengerKey: _scaffoldMessengerKey,
          initialRoute : "/",
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ru', ''),
            Locale('en', ''),
          ],
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: primaryColor,
                shape: const StadiumBorder(),
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
              ),
            ),


            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: primaryLightColor,
              iconColor: primaryColor,
              prefixIconColor: primaryColor,

              contentPadding: EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide.none,
              ),
            ),
            fontFamily: 'RobotoMono',
            primaryColor: primaryColor,
          ),
          navigatorKey: NavigatorHolder.navigatorKey,
          onGenerateRoute: _getRoute,
        )
      )
  );
}



