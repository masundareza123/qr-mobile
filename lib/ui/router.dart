import 'package:semangat/constans/route_name.dart';
import 'package:semangat/ui/views/home_view.dart';
import 'package:semangat/ui/views/login_view.dart';
import 'package:semangat/ui/views/sign_up_view.dart ';
import 'package:semangat/ui/views/camera_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: LoginView(),
      );
      case HomeViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );
    case SignUpViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: SignUpView(),
      );
    case CameraViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: CameraView(),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              'No route defined for ${settings.name}',
            ),
          ),
        ),
      );
  }
}

PageRoute _pageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}
