import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../controllers/clients_controller.dart';

class AlertDialogFormWidget {
  ClientsControler controller = GetIt.I.get<ClientsControler>();
  ValueChanged<bool>? onChanged;
  final _formKey = GlobalKey<FormState>();

  void showAddDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: ValueListenableBuilder(
                valueListenable: controller.store.state,
                builder: (context, value, child) {
                  return Form(
                    key: _formKey,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Offstage(
                            offstage: !controller.store.isDeleteClient!,
                            child: Column(children: [
                              SizedBox(
                                child: Text(
                                    "Você CONFIRMA que deseja deletar esse cliente?"),
                              ),
                              SizedBox(height: 50),
                              Icon(
                                Icons.warning,
                                color: Colors.yellowAccent.shade400,
                                size: 110,
                              ),
                            ]),
                          ),
                          Offstage(
                            offstage: !controller.store.formOnAlertDialog!,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(!controller.store.isEditAlertDialog.value
                                    ? "Adicionar novo cliente"
                                    : "Editar cliente"),
                                TextFormField(
                                  controller:
                                      controller.store.controlleTexField,
                                  decoration: const InputDecoration(
                                    labelText: 'Nome',
                                    hintText: 'Digite seu nome',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Campo obrigatório';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text("Ativo:"),
                                const SizedBox(
                                  height: 10,
                                ),
                                RxBuilder(builder: (context) {
                                  return Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0xff0bc6a5),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: DropdownButton<bool>(
                                        value: controller
                                            .store.dropdownValue.value,
                                        hint: Text('Selecione uma opção'),
                                        items: const [
                                          DropdownMenuItem<bool>(
                                            value: true,
                                            child: Text('Sim'),
                                          ),
                                          DropdownMenuItem<bool>(
                                            value: false,
                                            child: Text('Não'),
                                          ),
                                        ],
                                        onChanged: (value) {
                                          controller.store.dropdownValue.value =
                                              value!;

                                          print(
                                              'Opção selecionada: ${controller.store.dropdownValue.value}');
                                        },
                                      ));
                                })
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.red,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Não confirmar'),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color(0xff0bc6a5),
                      ),
                    ),
                    onPressed: () {
                      if (controller.store.isDeleteClient!) {
                        controller.deleteClient(context);
                      }
                      if (controller.store.isNewClient! &&
                          _formKey.currentState!.validate()) {
                        controller.createInfo(context);
                      }
                      if (controller.store.isEditAlertDialog.value) {
                        controller.editInfoClient(context);
                      }
                    },
                    child: const Text('Confirmar'),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
