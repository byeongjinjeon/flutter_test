import 'package:flutter/material.dart';
import "package:test1/test.dart";
import "package:test1/GridViewPage.dart";
import "package:test1/carousel.dart";
import "package:test1/timeline.dart";
import 'package:test1/gridview_wedget.dart';
import 'home_page.dart';

mixin RouteName {
  static const test = '/test';
  static const gridview = '/gridview';
  static const gridview2 = '/gridview2';
  static const carousel = '/carousel';
  static const timeline = '/timeline';
  static const homepage = '/homepage';
}

mixin Routes {
  static Map<String, WidgetBuilder> routes = {
    RouteName.test: (ctx) => const Test(title: '메뉴모음'),
    RouteName.gridview: (ctx) => const Gridviewpage(),
    RouteName.gridview2: (ctx) => GridViewWidget(),
    RouteName.carousel: (ctx) => const Carousel(),
    RouteName.timeline: (ctx) => const VideoTimelineScreen(),
    RouteName.homepage: (ctx) => HomePage(),
  };
}
