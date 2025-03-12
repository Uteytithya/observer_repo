import 'package:observer_repo/Exercise-1/WEEK-5/model/ride/locations.dart';
import 'package:observer_repo/Exercise-1/WEEK-5/repository/locations_repository.dart';

import '../dummy_data/dummy_data.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {

  static LocationsService? _instance;
  

  final LocationsRepository repository;

  LocationsService._internal(this.repository) {}

  List<Location> getLocations() {
    return repository.getLocations();
  }

  static LocationsService get instance  {
    if (_instance == null) {
      throw Exception("You should initialize your service first. Please call the initializer");
    }
    return _instance!;
  } 

  static void initialize(LocationsRepository repository) {
    _instance ??= LocationsService._internal(repository);
  }

  List<Location> getLocationsFor(String query) {
    return repository.getLocations().where((location) => location.name.toLowerCase().contains(query.toLowerCase())).toList();
  }
  
}