import 'package:flutter/material.dart';
import 'package:observer_repo/Exercise-1/WEEK-5/dummy_data/dummy_data.dart';
import 'package:observer_repo/Exercise-1/WEEK-5/listener/observer/mobile_display.dart';
import 'package:observer_repo/Exercise-1/WEEK-5/listener/observer/web_display.dart';
import 'package:observer_repo/Exercise-1/WEEK-5/service/rides_service.dart';
import 'package:observer_repo/Exercise-1/WEEK-5/repository/mock/mock_locations_repository.dart';
import 'package:observer_repo/Exercise-1/WEEK-5/repository/mock/mock_rides_repository.dart';
import 'package:observer_repo/Exercise-1/WEEK-5/service/locations_service.dart';
import 'package:observer_repo/Exercise-1/WEEK-5/repository/mock/mock_ride_preferences_repository.dart';

import 'screens/ride_pref/ride_pref_screen.dart';
import 'service/ride_prefs_service.dart';
import 'theme/theme.dart';

void main() {

  // 1 - Initialize the ride pref services
  RidePrefService.initialize(MockRidePreferencesRepository());

  // 2. Initialize the locations service
  LocationsService.initialize(MockLocationsRepository());

  // 3. Initialize the rides service
  RidesService.initialize(MockRidesRepository());

  MobileDisplay mobile = MobileDisplay();
  WebDisplay web = WebDisplay();

  RidePrefService.instance.addListener(mobile);
  RidePrefService.instance.addListener(web);

  print("\nNew Preferences Changed");
  RidePrefService.instance.changePreference(fakeRidePrefs[1]);
  print("\nNew Preferences Changed");
  RidePrefService.instance.changePreference(fakeRidePrefs[2]);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(body: RidePrefScreen()),
    );
  }
}
