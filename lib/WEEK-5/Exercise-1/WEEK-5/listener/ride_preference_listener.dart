import 'package:observer_repo/WEEK-5/Exercise-1/WEEK-5/model/ride_pref/ride_pref.dart';

abstract class RidePreferencesListener{
  void onPreferenceSelected(RidePreference selectedPreference);
}