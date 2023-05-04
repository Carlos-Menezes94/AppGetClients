import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../core/assset_loader.dart';
import '../controllers/clients_controller.dart';
import '../widgets/buttons_actions_widget.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  ClientsControler controller = GetIt.I.get<ClientsControler>();

  @override
  Widget build(BuildContext context) {
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
            if (controller.store.isConfirmSucess.value!) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(AssetLoader.sucessoConfirm,
                        fit: BoxFit.fill, repeat: true, animate: true)
                  ]);
            }
            if (snapshot.hasError) {
              return Scaffold(
                  body: Container(
                      alignment: Alignment.center,
                      child: Text('Error: ${snapshot.error}')));
            }

            return Scaffold(
              appBar: AppBar(backgroundColor: Color(0xff0bc6a5)),
              floatingActionButton: FloatingActionButton(backgroundColor: Color(0xff0bc6a5),
                onPressed: () {
                  controller.store.controlleTexField.text = "";
                  controller.callButtonNewClient(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const ConfirmActionPage()),
                  // );
                },
                child: Icon(Icons.add),
              ),
              body: RxBuilder(builder: (context) {
                if (controller.store.isConfirmSucess.value!) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(AssetLoader.sucessoConfirm,
                            fit: BoxFit.fill, repeat: true, animate: true)
                      ]);
                }
                if (controller.store.myResponseModel!.value!.entities.isEmpty) {
                  return Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("Lista vazia!")]),
                  );
                }
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller
                            .store.myResponseModel!.value!.entities.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(controller.store.myResponseModel!.value!
                                    .entities[index].name),
                                ButtonsActionsWidget(
                                  name: controller.store.myResponseModel!.value!
                                      .entities[index].name,
                                  id: controller.store.myResponseModel!.value!
                                      .entities[index].id,
                                  active: controller.store.myResponseModel!
                                      .value!.entities[index].active,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Offstage(
                      offstage: controller
                              .store.myResponseModel!.value!.entities.length <
                          10,
                      child: ElevatedButton(
                        onPressed: () {
                          print(controller.store.myResponseModel!.value!
                                  .entities.length <
                              10);
                          // Ação do botão
                        },
                        child: Text('Meu Botão'),
                      ),
                    ),
                  ],
                );
              }),
            );
          }),
    );
  }
}
