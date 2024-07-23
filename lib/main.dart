import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_uza_technologies/features/weather/providers/weather_provider.dart';
import 'package:weather_app_uza_technologies/features/weather/views/weather_scaffold.dart';

import 'features/weather/providers/theme_provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return WeatherProvider(
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: themeProvider.themeMode,
        home: const WeatherHomeScreen(),
      ),
    );
  }
}
