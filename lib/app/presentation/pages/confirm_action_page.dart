import 'package:app_menezes/core/assset_loader.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ConfirmActionPage extends StatefulWidget {
  const ConfirmActionPage({super.key});

  @override
  State<ConfirmActionPage> createState() => _ConfirmActionPageState();
}

class _ConfirmActionPageState extends State<ConfirmActionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        Lottie.asset(AssetLoader.sucessoConfirm,

          fit: BoxFit.fill,repeat: true,animate: true
        )
      ]),
    );
  }
}
