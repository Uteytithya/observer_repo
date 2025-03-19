import 'package:observer_repo/WEEK-5/Exercise-1/WEEK-5/model/ride/ride.dart';
import 'package:observer_repo/WEEK-5/Exercise-1/WEEK-5/model/ride_pref/ride_pref.dart';
import 'package:observer_repo/WEEK-5/Exercise-1/WEEK-5/service/rides_service.dart';

abstract class RidesRepository {
  List<Ride> getRides(RidePreference preferences, RidesFilter? filter, RideSortType? sortType);
}