import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../controllers/client_controller.dart';

class AlertDialogFormWidget {
  ClientControler controller = GetIt.I.get<ClientControler>();
  final TextEditingController _controller1 = TextEditingController();
  final List<String> _items = ['SIM', 'NÃO'];
  bool? _value;
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
                            offstage: !controller.store.isEditClient!,
                            child: Column(children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Nome',
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) {
                                  // callback para quando o valor do campo mudar
                                },
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Nome',
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) {
                                  // callback para quando o valor do campo mudar
                                },
                              )
                            ]),
                          ),
                          Offstage(
                            offstage: !controller.store.isDeleteClient!,
                            child: Column(children: const [
                              SizedBox(
                                  child: Text(
                                      "Você CONFIRMA que deseja deletar esse cliente?"))
                            ]),
                          ),
                          Offstage(
                            offstage: !controller.store.isNewClient!,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text('Adicionar'),
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
                                        border: Border.all(color: Colors.blue)),
                                    child: DropdownButton<bool>(
                                      value: _value,
                                      hint: Text(
                                          controller.store.titleDropdown.value),
                                      items: [
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
                                        controller.store.boolDropdown.value =
                                            value!;
                                        controller.isActiveDropdown();
                                        print(value);
                                      },
                                    ),
                                  );
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
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // submit form
                    controller.createInfo(context);
                  }
                },
                child: const Text('Salvar'),
              ),
            ],
          );
        });
  }
}
