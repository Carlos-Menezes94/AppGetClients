import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'app/depedency_injector/di_container.dart';
import 'app/presentation/pages/home_page.dart';

void main() async {
  DiContainer.start();
  final dio = Dio();

  runApp(const MaterialApp(
    home: HomePage(),
  ));
}
