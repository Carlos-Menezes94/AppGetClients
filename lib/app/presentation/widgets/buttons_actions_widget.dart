import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import '../controllers/clients_controller.dart';

class ButtonsActionsWidget extends StatelessWidget {
  final int id;
  final String name;
  final int active;
  const ButtonsActionsWidget(
      {super.key, required this.id, required this.name, required this.active});

  @override
  Widget build(BuildContext context) {
    ClientsControler controller = GetIt.I.get<ClientsControler>();

    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            controller.store.dropdownValue.value = active == 1 ? true : false;
            controller.store.controlleTexField.text = name;
            controller
                .callButtonEditClient(context); // Lógica para a ação de edição
          },
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            controller.store.idd = id.toString();
            controller.callButtonDeleteClient(context);
          },
        )
      ],
    );
  }
}
