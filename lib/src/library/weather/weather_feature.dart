// Copyright (c) 2012, Alexandre Ardhuin
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

part of google_maps_weather;

abstract class _WeatherFeature {
  WeatherConditions current;
  List<WeatherForecast> forecast;
  String location;
  TemperatureUnit temperatureUnit;
  WindSpeedUnit windSpeedUnit;
}

class WeatherFeature extends jsw.TypedProxy implements _WeatherFeature {
  static WeatherFeature cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new WeatherFeature.fromJsProxy(jsProxy));

  WeatherFeature() : super();
  WeatherFeature.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override WeatherConditions get current => WeatherConditions.cast($unsafe.current);
  @override List<WeatherForecast> get forecast => jsw.JsArray.cast($unsafe.forecast, WeatherForecast.cast);
  @override TemperatureUnit get temperatureUnit => TemperatureUnit.find($unsafe.temperatureUnit);
  @override WindSpeedUnit get windSpeedUnit => WindSpeedUnit.find($unsafe.windSpeedUnit);
}