import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../controllers/client_controller.dart';
import '../widgets/buttons_actions_widget.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  ClientControler controller = GetIt.I.get<ClientControler>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: controller.store,
        builder: (context, value, child) {
          return RefreshIndicator(
            onRefresh: controller.getListClients,
            child: FutureBuilder(
                future: controller.getListClients(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (controller.store.state.value.isLoading()) {
                    return Scaffold(
                        body: Container(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator()));
                  }
                  if (snapshot.hasError) {
                    return Scaffold(
                        body: Container(
                            alignment: Alignment.center,
                            child: Text('Error: ${snapshot.error}')));
                  }
                  return Scaffold(
                    appBar: AppBar(),
                    floatingActionButton: FloatingActionButton(
                      onPressed: () {
                        controller.store.controlleTexField.text = "";
                        controller.newClient(context);
                      },
                      child: Icon(Icons.add),
                    ),
                    body: RxBuilder(builder: (context) {
                      return Container(
                        alignment: Alignment.center,
                        child: ListView.builder(
                          itemCount: controller
                              .store.myResponseModel!.value!.entities.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(controller.store.myResponseModel!.value!
                                      .entities[index].name),
                                  ButtonsActionsWidget(
                                    active: controller.store.myResponseModel!
                                        .value!.entities[index].id,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  );
                }),
          );
        });
  }
}
