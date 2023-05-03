import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import '../controllers/client_controller.dart';

class ButtonsActionsWidget extends StatelessWidget {
  final int active;
  const ButtonsActionsWidget({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    ClientControler controller = GetIt.I.get<ClientControler>();

    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            controller.editClient(context); // Lógica para a ação de edição
          },
        ),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            print(active);
            controller.deleteClient(context);
          },
        )
      ],
    );
  }
}
