import 'dart:convert';

List<City> cityFromJson(String str) =>
    List<City>.from(json.decode(str).map((x) => City.fromJson(x)));

String cityToJson(List<City> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class City {
  final String id;
  final String city;

  const City({
    required this.id,
    required this.city,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json["id"],
      city: json["city"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "city": city,
      };
}
