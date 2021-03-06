import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:google_maps/google_maps.dart';

void main() {
  final mapOptions = new MapOptions()
    ..zoom = 4
    ..center = new LatLng(-33, 151)
    ..mapTypeControl = true
    ..mapTypeControlOptions = (new MapTypeControlOptions()
      ..style = MapTypeControlStyle.DROPDOWN_MENU
    )
    ..zoomControl = true
    ..zoomControlOptions = (new ZoomControlOptions()
      ..style = ZoomControlStyle.SMALL
    )
    ..mapTypeId = MapTypeId.ROADMAP
    ;

  final map = new GMap(query("#map_canvas"), mapOptions);
}
