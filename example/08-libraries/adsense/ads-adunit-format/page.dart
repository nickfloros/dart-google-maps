import 'dart:html' hide Events;
import 'package:js/js.dart' as js;
import 'package:google_maps/google_maps.dart';
import 'package:google_maps/google_maps_adsense.dart';

final SAMPLE_AD_STYLES = {
  'default': {
    'color_bg': '#c4d4f3',
    'color_border': '#e5ecf9',
    'color_link': '#0000cc',
    'color_text': '#000000',
    'color_url': '#009900',
  },
  'modern': {
    'color_bg': '#ffffff',
    'color_border': '#000000',
    'color_link': '#1155cc',
    'color_text': '#000000',
    'color_url': '#009900',
  },
  'plain': {
    'color_bg': '#f5f5f5',
    'color_border': '#cccccc',
    'color_link': '#1155cc',
    'color_text': '#333333',
    'color_url': '#009900',
  },
  'kennedy': {
    'color_bg': '#f1f1f1',
    'color_border': '#dd4b39',
    'color_link': '#4d90fe',
    'color_text': '#222222',
    'color_url': '#3d9400',
  },
  'flamingo': {
    'color_bg': '#feeeff',
    'color_border': '#d1d1ed',
    'color_link': '#5577ee',
    'color_text': '#000000',
    'color_url': '#44bbbb',
  },
  'monochrome': {
    'color_bg': '#eeeeee',
    'color_border': '#666666',
    'color_link': '#333333',
    'color_text': '#666666',
    'color_url': '#999999',
  },
  'barbecue': {
    'color_bg': '#666666',
    'color_border': '#555555',
    'color_link': '#ffcc00',
    'color_text': '#808080',
    'color_url': '#e8ab00',
  },
  'miami': {
    'color_bg': '#d6f8ff',
    'color_border': '#89d1ff',
    'color_link': '#3b8aeb',
    'color_text': '#333333',
    'color_url': '#53be05',
  },
  'shamrock': {
    'color_bg': '#f5ffe9',
    'color_border': '#449944',
    'color_link': '#009900',
    'color_text': '#596659',
    'color_url': '#779977',
  }
};

void main() {
  final mapOptions = new MapOptions()
    ..center = new LatLng(36.5987, -121.8950)
    ..zoom = 12
    ..mapTypeId = MapTypeId.ROADMAP
    ;
  final map = new GMap(query("#map_canvas"), mapOptions);


  final adUnitDiv = new DivElement();

  // Note: replace the publisher ID noted here with your own
  // publisher ID.
  final adUnitOptions = new AdUnitOptions()
    ..format = AdFormat.HALF_BANNER
    ..position = ControlPosition.TOP_CENTER
    ..$unsafe.backgroundColor = '#c4d4f3'
    ..$unsafe.borderColor = '#e5ecf9'
    ..$unsafe.titleColor = '#0000cc'
    ..$unsafe.textColor = '#000000'
    ..$unsafe.urlColor = '#009900'
    ..publisherId = 'ca-google-maps_apidocs'
    ..map = map
    ..$unsafe.visible = true
    ;
  final adUnit = new AdUnit(adUnitDiv, adUnitOptions);

  final SelectElement format = query('#format');
  js.retain(adUnit);
  event.addDomListener(format, 'change', (e) {
    final String adsFormat = maps.adsense.AdFormat[format.value];
    adUnit.format = AdFormat.find(adsFormat);
  });

  final SelectElement style = query('#style');
  js.retain(adUnit);
  event.addDomListener(style, 'change', (e) {
    final adStyle = SAMPLE_AD_STYLES[style.value];
    // TODO undocumented or undefined functions
    adUnit.$unsafe
      //..call("setBackgroundColor", [adStyle['color_bg']])
      //..call("setBorderColor", [adStyle['color_border']])
      //..call("setTitleColor", [adStyle['color_link']])
      //..call("setTextColor", [adStyle['color_text']])
      //..call("setUrlColor", [adStyle['color_url']])
      ;
  });

  final SelectElement position = query('#position');
  js.retain(adUnit);
  event.addDomListener(position, 'change', (e) {
    final int adsPosition = maps.ControlPosition[position.value];
    adUnit.position = ControlPosition.find(adsPosition);
  });
}