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
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
