class Temperature {
  double _celsius;

  double get celsius => _celsius;
  set celsius(double celsius) => _celsius = celsius;

  double get farenheit => (_celsius * 1.8) + 32;
  set farenheit(double farenheit) => _celsius = (farenheit - 32) / 1.8;

  Temperature.celsius(this._celsius);
  Temperature.farenheit(double farenheit)
      : this._celsius = (farenheit - 32) / 1.8;
}

void main() {
  final c = Temperature.celsius(100);
  c.celsius = 10.0;

  final f = Temperature.farenheit(10);
  f.farenheit = 10;
}
