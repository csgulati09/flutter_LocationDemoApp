import 'package:flutter/material.dart';
import 'screens/LocationDetail/LocationDetail.dart';
import 'screens/Locations/locations.dart';
import 'style.dart';

const LocationsRoute = '/';
const LocationDetailRoute = '/LocationDetail';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => FirstScreen(),
        //   '/second': (context) => SecondScreen(),
        // },
        onGenerateRoute: _routes(),
        theme: _theme(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name){
        case LocationsRoute:
          screen = Locations();
          break;
        case LocationDetailRoute:
          screen = LocationDetail(arguments['id']);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme(){
    return ThemeData(
        appBarTheme: AppBarTheme(
          // ignore: deprecated_member_use
            textTheme: TextTheme(title: AppBarTextStyle)
        ),
        textTheme: TextTheme(
          // ignore: deprecated_member_use
          title: TitleTextStyle,
          // ignore: deprecated_member_use
          subtitle: SubTitleTextStyle,
          caption: CaptionTextStyle,
          // ignore: deprecated_member_use
          body1: Body1TextStyle,

        )
    );
  }
}
