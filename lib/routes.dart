import 'package:flutter/material.dart';

import 'views/home.dart';
import 'views/track_details.dart';
import 'views/undefined.dart';

class Routes {
  static const String root = '/';
  static const String trackDetails = '/trackDetails';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case root:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case trackDetails:
        return MaterialPageRoute(
            builder: (context) => TrackDetailsPage(trackId: settings.arguments as int));
      default:
        return MaterialPageRoute(
            builder: (context) => UndefinedView(name: settings.name));
    }
  }
}
