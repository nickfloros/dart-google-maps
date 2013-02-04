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

part of google_maps_visualization;

abstract class _HeatmapLayer {
  @jsw.dartified MVCArray<dynamic/*LatLng|WeightedLocation*/> getData();
  @jsw.dartified GMap getMap();
  @jsw.dartified void setData(dynamic/*MVCArray.<LatLng|WeightedLocation>|Array.<LatLng|WeightedLocation>*/ data);
  @jsw.dartified void setMap(GMap map);
}

class HeatmapLayer extends MVCObject implements _HeatmapLayer {
  static HeatmapLayer cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new HeatmapLayer.fromJsProxy(jsProxy));

  HeatmapLayer([HeatmapLayerOptions opts]) : super(maps.visualization.HeatmapLayer, [opts]);
  HeatmapLayer.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override MVCArray<dynamic/*LatLng|WeightedLocation*/> getData() => MVCArray.cast($unsafe.getData(), (e) => LatLng.isInstance(e) ? LatLng.cast(e) : WeightedLocation.cast(e));
  @override GMap getMap() => GMap.cast($unsafe.getMap());
  @override void setData(dynamic/*MVCArray.<LatLng|WeightedLocation>|Array.<LatLng|WeightedLocation>*/ data) {
    $unsafe.setData(MVCArray.isInstance(data) ? MVCArray.cast(data) : jsw.JsArray.jsify(data));
  }

  MVCArray<dynamic/*LatLng|WeightedLocation*/> get data => getData();
  GMap get map => getMap();
  set data(dynamic/*MVCArray.<LatLng|WeightedLocation>|Array.<LatLng|WeightedLocation>*/ data) => setData(data);
  set map(GMap map) => setMap(map);
}