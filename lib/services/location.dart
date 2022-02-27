import'package:geolocator/geolocator.dart';

class MyLocation{

  var log;
  var lat;
  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
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
    return _getPositionCoordinates();
  }


  Future<Position>  _getPositionCoordinates() async{
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low) ;
    print(position);
    lat =  position.latitude;
    log =  position.longitude;
    return position;
  }

}