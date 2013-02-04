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

part of google_maps_places;

abstract class _AutocompletionRequest {
  LatLngBounds bounds;
  ComponentRestrictions componentRestrictions;
  String input;
  LatLng location;
  num offset;
  num radius;
  List<String> types;
}

class AutocompletionRequest extends jsw.TypedProxy implements _AutocompletionRequest {
  static AutocompletionRequest cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new AutocompletionRequest.fromJsProxy(jsProxy));

  AutocompletionRequest() : super();
  AutocompletionRequest.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override LatLngBounds get bounds => LatLngBounds.cast($unsafe.bounds);
  @override ComponentRestrictions get componentRestrictions => ComponentRestrictions.cast($unsafe.componentRestrictions);
  @override LatLng get location => LatLng.cast($unsafe.location);
  @override List<String> get types => jsw.JsArray.cast($unsafe.types);
}