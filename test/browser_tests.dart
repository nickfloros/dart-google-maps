library tests;

import 'dart:html';
import 'dart:json';
import 'package:unittest/unittest.dart';
import 'package:unittest/html_config.dart';

import 'package:js/js.dart' as js;
import 'package:google_maps/google_maps.dart';

injectSource(code) {
  final script = new ScriptElement();
  script.type = 'text/javascript';
  script.innerHtml = code;
  document.body.nodes.add(script);
}

main() {
  useHtmlConfiguration();

  test('LatLng.toString call js', () {
    final latLng = new LatLng(2, 8);
    expect(latLng.lat,equals(2) );
    expect(latLng.toString(), equals("(2, 8)"));
  });

  test('LatLng.equals call js', () {
    final latLng1 = new LatLng(2, 8);
    final latLng2 = new LatLng(2, 8);
    final latLng3 = new LatLng(2, 9);
    expect(latLng1.equals(latLng2), isTrue);
    expect(latLng1.equals(latLng3), isFalse);
  });

  test('MVCArray works', () {
    final mvcArray = new MVCArray();
    mvcArray.onInsertAt.listen((int i) => print("inserted at $i"));
    mvcArray.onRemoveAt.listen((IndexAndElement e) => print("removed ${e.element} at ${e.index}"));
    mvcArray.onSetAt.listen((IndexAndElement e) => print("set ${e.element} at ${e.index}"));
    mvcArray.push("aa");
    expect(mvcArray.length, equals(1));
    mvcArray.setAt(0, "bb");
    expect(mvcArray.length, equals(1));
    mvcArray.removeAt(0);
    expect(mvcArray.length, equals(0));
  });
}
