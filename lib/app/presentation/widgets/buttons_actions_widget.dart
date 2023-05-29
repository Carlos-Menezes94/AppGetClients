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
            controller.store.changePage.value = false;

            controller.store.formOnAlertDialog = true;
            controller.store.dropdownValue.value = active == 1 ? true : false;
            controller.store.controlleTexField.text = name;
            controller.store.idd = id.toString();

            controller.callButtonEditClient(context);
          },
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            controller.store.changePage.value = false;
            controller.store.formOnAlertDialog = false;
            controller.store.idd = id.toString();
            controller.callButtonDeleteClient(context);
          },
        )
      ],
    );
  }
}
