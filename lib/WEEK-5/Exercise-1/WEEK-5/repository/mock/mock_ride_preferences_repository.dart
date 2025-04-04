import 'package:observer_repo/WEEK-5/Exercise-1/WEEK-5/model/ride_pref/ride_pref.dart';
import 'package:observer_repo/WEEK-5/Exercise-1/WEEK-5/repository/ride_preferences_repository.dart';

import '../../dummy_data/dummy_data.dart';

class MockRidePreferencesRepository extends RidePreferencesRepository {
  final List<RidePreference> _pastPreferences = fakeRidePrefs;

  @override
  List<RidePreference> getPastPreferences() {
    return _pastPreferences;
  }

  @override
  void addPreference(RidePreference preference) {
    _pastPreferences.add(preference);
  }
}
