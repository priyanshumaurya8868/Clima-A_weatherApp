import 'package:flutter/material.dart';


const String API_key = "2534351368d5269258fb304f05f5bd7a";
const String URL= 'https://api.openweathermap.org/data/2.5/weather';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldInputDecoration =
InputDecoration(
  filled: true,
  fillColor: Colors.white,
  contentPadding: EdgeInsets.all(10.0),
  hintText: "Enter City (e.g. city,state,countryCode)",
  hintStyle: TextStyle(color: Colors.grey),
  icon: Icon(Icons.location_city, color: Colors.white),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);