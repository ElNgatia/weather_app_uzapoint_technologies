import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import 'current_weather_screen.dart';
import 'forecast_screen.dart';
import 'search_screen.dart';

class WeatherHomeScreen extends StatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  State<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
  late Future<bool> _connectivityFuture;

  @override
  void initState() {
    super.initState();
    _connectivityFuture = checkInternetConnectivity();
  }

  Future<bool> checkInternetConnectivity() async {
    final List<ConnectivityResult> result =
        await (Connectivity().checkConnectivity());

    return result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi);
  }

  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    CurrentWeatherScreen(),
    ForecastScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _retryConnectivityCheck() {
    setState(() {
      _connectivityFuture = checkInternetConnectivity();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _connectivityFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError || !snapshot.data!) {
          return Scaffold(
            body: Center(
              child: Column(
                children: [
                  const Text(
                    'No Internet Connection',
                    style: TextStyle(fontSize: 24),
                  ),
                  ElevatedButton(
                    onPressed: _retryConnectivityCheck,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Weather App'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SearchPage();
                    }));
                  },
                ),
              ],
            ),
            body: _screens.elementAt(_selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.wb_sunny),
                  label: 'Current Weather',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.cloud),
                  label: 'Forecast',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
              child: const Icon(Icons.brightness_6),
            ),
          );
        }
      },
    );
  }
}
