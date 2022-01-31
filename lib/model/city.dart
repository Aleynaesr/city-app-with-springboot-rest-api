class City {
  final String id;
  final String city;

  const City({
    required this.id,
    required this.city,
  });
  //Mapping with id and city fromJson
  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json["id"],
      city: json["city"],
    );
  }
  //Put the cities from map to list
  static fromJsonList(List<dynamic> json) {
    List<City> cities = [];
    for (Map<String, dynamic> m in json) {
      cities.add(City.fromJson(m));
    }
    return cities;
  }
}
