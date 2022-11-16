import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/blocs/track_bloc.dart';
import 'package:untitled/blocs/track_state.dart';

import 'routes.dart';
import 'views/undefined.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrackBloc>(
      create: (_) => TrackBloc(TrackState()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
        onGenerateRoute: Routes.generateRoutes,
        onUnknownRoute: (settings) => MaterialPageRoute(
            builder: (context) => UndefinedView(name: settings.name)),
        initialRoute: Routes.root,
      ),
    );
  }
}
