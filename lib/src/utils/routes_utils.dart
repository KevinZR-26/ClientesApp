import 'package:catalogoclientes/src/pages/addClient_page.dart';
import 'package:catalogoclientes/src/pages/clientInfo_page.dart';
import 'package:catalogoclientes/src/pages/editClient_page.dart';
import 'package:catalogoclientes/src/pages/home_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    'home': (_) => HomePage(),
    'addClient': (_) => AddClientPage(),
    'clientInfo': (_) => ClientInfoPage(),
    'editClient': (_) => EditClientPage(),
  };
}
