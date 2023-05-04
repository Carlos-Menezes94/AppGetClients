import 'package:app_menezes/core/assset_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:rx_notifier/rx_notifier.dart';

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
