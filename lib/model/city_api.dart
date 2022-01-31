import 'dart:convert';

import 'package:http/http.dart' as http;

import 'city.dart';

Future<List<City>> fetchCities() async {
  final response = await http.get(Uri.parse('http://192.168.1.21:8080/cities'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // avoid from bad utf8 encoding
    print(utf8.decode(response.bodyBytes));
    return City.fromJsonList(jsonDecode(utf8.decode(response.bodyBytes)));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load cities');
  }
}
