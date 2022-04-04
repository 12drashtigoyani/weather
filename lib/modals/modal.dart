class Weather {
  final String? description, country, name, icon, main;
  final int? deg, all, humidity, visibility, sunrise, sunset;
  final double? temp;
  final dynamic speed;
  Weather({
    this.name,
    this.all,
    this.country,
    this.deg,
    this.speed,
    this.description,
    this.humidity,
    this.temp,
    this.visibility,
    this.icon,
    this.sunrise,
    this.sunset,
    this.main,
  });
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      all: json['clouds']['all'],
      name: json['name'],
      country: json['sys']['country'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      speed: json['wind']['speed'],
      deg: json['wind']['deg'],
      temp: json['main']['temp'],
      humidity: json['main']['humidity'],
      description: json['weather'][0]['description'],
      main: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
      visibility: json['visibility'],
    );
  }
}
