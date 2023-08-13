import 'package:geolocator/geolocator.dart';

calcDistC() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // Define the coordinates of the particular location
  const double destinationLatitude = 16.52411565861905;
  const double destinationLongitude = 80.79135279630846;

// Get the current location
  Position currentPosition = await Geolocator.getCurrentPosition();

// Calculate the distance between the current location and the particular location
  double distanceInMeters = Geolocator.distanceBetween(
    currentPosition.latitude,
    currentPosition.longitude,
    destinationLatitude,
    destinationLongitude,
  );

// Convert the distance from meters to kilometers
  double distanceInKilometers = (distanceInMeters / 1000) + 5.0;

// Round the distance to two decimal places
  double roundedDistanceInKilometers =
      double.parse(distanceInKilometers.toStringAsFixed(2));

// Print the distance
  // print(
  //     'The distance between the current location and the particular location is $roundedDistanceInKilometers Km');

  return '$roundedDistanceInKilometers Km';
}
