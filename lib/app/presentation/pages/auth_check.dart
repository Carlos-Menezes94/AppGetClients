import 'package:app_menezes/app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../core/app_state.dart';
import '../controllers/clients_controller.dart';
import 'home_page.dart';
import 'login_page.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = GetIt.I.get<AuthService>();
    ClientsControler controller = GetIt.I.get<ClientsControler>();

    return ValueListenableBuilder<AppState>(
        valueListenable: controller.store.state,
        builder: (context, state, child) {
          if (auth.isLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (auth.user == null) {
            return LoginPage();
          } else
            return HomePage();
        });
  }
}
