import 'package:album_stickers/src/grid_page.dart';
import 'package:album_stickers/src/login_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRotes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginPage(),
    'grid': (BuildContext context) => GridPage(),
    
  };
}
