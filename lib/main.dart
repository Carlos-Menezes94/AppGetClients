import 'package:app_menezes/app/presentation/pages/auth_check.dart';
import 'package:app_menezes/core/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/depedency_injector/di_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  DiContainer.start();

  runApp(const MaterialApp(
    home: AuthCheck(),
  ));
}
