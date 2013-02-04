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

part of google_maps;

abstract class _InfoWindow {
  void close();
  @jsw.dartified dynamic/*string|Node*/ getContent();
  @jsw.dartified LatLng getPosition();
  @jsw.dartified num getZIndex();
  void open([dynamic/*Map|StreetViewPanorama*/ map, MVCObject anchor]);
  @jsw.dartified void setContent(dynamic/*string|Node*/ content);
  @jsw.dartified void setOptions(InfoWindowOptions options);
  @jsw.dartified void setPosition(LatLng position);
  @jsw.dartified void setZIndex(num zIndex);
}

class InfoWindow extends MVCObject implements _InfoWindow {
  static InfoWindow cast(js.Proxy jsProxy) => jsw.transformIfNotNull(jsProxy, (jsProxy) => new InfoWindow.fromJsProxy(jsProxy));

  InfoWindow([InfoWindowOptions opts]) : super(maps.InfoWindow, [opts]);
  InfoWindow.fromJsProxy(js.Proxy jsProxy) : super.fromJsProxy(jsProxy);

  @override LatLng getPosition() => LatLng.cast($unsafe.getPosition());

  Object get content => getContent();
  LatLng get position => getPosition();
  num get zIndex => getZIndex();
  set content(dynamic content) => setContent(content);
  set options(InfoWindowOptions options) => setOptions(options);
  set position(LatLng position) => setPosition(position);
  set zIndex(num zIndex) => setZIndex(zIndex);

  InfoWindowEvents get on => new InfoWindowEvents._(this);
}

class InfoWindowEvents {
  static final CLOSECLICK = "closeclick";
  static final CONTENT_CHANGED = "content_changed";
  static final DOMREADY = "domready";
  static final POSITION_CHANGED = "position_changed";
  static final ZINDEX_CHANGED = "zindex_changed";

  final InfoWindow _infoWindow;

  InfoWindowEvents._(this._infoWindow);

  NoArgsEventListenerAdder get closeclick => new NoArgsEventListenerAdder(_infoWindow, CLOSECLICK);
  NoArgsEventListenerAdder get contentChanged => new NoArgsEventListenerAdder(_infoWindow, CONTENT_CHANGED);
  NoArgsEventListenerAdder get domready => new NoArgsEventListenerAdder(_infoWindow, DOMREADY);
  NoArgsEventListenerAdder get positionChanged => new NoArgsEventListenerAdder(_infoWindow, POSITION_CHANGED);
  NoArgsEventListenerAdder get zindexChanged => new NoArgsEventListenerAdder(_infoWindow, ZINDEX_CHANGED);
}