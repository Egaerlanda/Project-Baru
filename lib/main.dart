import 'package:apkega/providers/berita_panel_provider.dart';
import 'package:apkega/providers/dashboard_provider.dart';
import 'package:apkega/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    builder: (context, Widget) {
      return const MaterialApp(
        home: LoginView(),
      );
    }, providers: [
      ChangeNotifierProvider(
        create: (c)=>DashboardProvider()
      ),
      ChangeNotifierProvider(
        create: (c)=>BeritaPanelProvider()
      )
    ],
  ));
}