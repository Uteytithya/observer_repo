import 'package:observer_repo/Exercise-1/WEEK-5/dummy_data/dummy_data.dart';
import 'package:observer_repo/Exercise-1/WEEK-5/listener/ride_preference_listener.dart';
import 'package:observer_repo/Exercise-1/WEEK-5/model/ride_pref/ride_pref.dart';

class RidePreferenceSubject {
  final List<RidePreferencesListener> _listeners = [];
  RidePreference _currentPreference = fakeRidePrefs[0];

  void _notifyListeners() {
    for (var listener in _listeners) {
      listener.onPreferenceSelected(_currentPreference);
    }
  }
  void addListener(RidePreferencesListener listener) {
    _listeners.add(listener);
  }
  void changePreference(RidePreference newPreference) {
    _currentPreference = newPreference;
    _notifyListeners();
  }


}