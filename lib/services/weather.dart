import 'location.dart';
import 'networking.dart';
import '../utilities/constants.dart';

class WeatherModel {

  Future getLocationWeather()async{
    var loc = MyLocation();
    await loc.getLocation();

    var weatherData = await NetworkHelper(url: "$URL?lat=${loc.lat??-1}&lon=${loc.log??-1}&appid=$API_key&units=metric")
        .getData();

    return weatherData;
  }


  Future getCityWeather(String cityName) async{
    var loc = MyLocation();
    await loc.getLocation();

    var weatherData = await NetworkHelper(url: "$URL?q=$cityName&appid=$API_key&units=metric")
        .getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
