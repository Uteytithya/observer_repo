import 'package:observer_repo/WEEK-5/Exercise-1/WEEK-5/listener/ride_preference_listener.dart';
import 'package:observer_repo/WEEK-5/Exercise-1/WEEK-5/model/ride_pref/ride_pref.dart';

class MobileDisplay implements RidePreferencesListener {
  @override
  void onPreferenceSelected(RidePreference selectedPreference) {
    print("📱 : Preference has changed\n - New Departure: ${selectedPreference.departure}\n - New Departure Date: ${selectedPreference.departureDate}\n- New Arrival: ${selectedPreference.arrival}\n - New Requested Seat: ${selectedPreference.requestedSeats} ");
  }
}