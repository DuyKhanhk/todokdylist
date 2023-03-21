import 'package:flutter/material.dart';
import 'package:todokdylist/screens/recycle_bin.dart';
import 'package:todokdylist/screens/tabs_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(
          builder: (_) => const RecycleBin(),
        );
      case TabsScreen.id:
        return MaterialPageRoute(builder: (_) => const TabsScreen());
    }
    return null;
  }
}
