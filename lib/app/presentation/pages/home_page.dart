import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../core/app_state.dart';
import '../../../core/assset_loader.dart';
import '../controllers/clients_controller.dart';
import '../widgets/buttons_actions_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ClientsControler controller = GetIt.I.get<ClientsControler>();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getListClients();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.getListClients,
      child: ValueListenableBuilder<AppState>(
          valueListenable: controller.store.state,
          builder: (context, state, child) {
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Color(0xff0bc6a5),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.logout),
                      onPressed: () {
                        controller.logout(context);
                      },
                    )
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: const Color(0xff0bc6a5),
                  onPressed: () {
                    controller.store.controlleTexField.text = "";
                    controller.store.formOnAlertDialog = true;
                    controller.store.isNewClient = false;
                    controller.callButtonNewClient(context);
                  },
                  child: Icon(Icons.add),
                ),
                body: RxBuilder(builder: (context) {
                  print("teste");
                  if (controller.store.state.value.isLoading()) {
                    return Container(
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator());
                  }

                  if (controller.store.isConfirmSucess.value!) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(AssetLoader.sucessoConfirm,
                              fit: BoxFit.fill, repeat: true, animate: true)
                        ]);
                  }

                  if (controller.store.state.value.hasSuccess()) {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: controller.store.myResponseModel!.value!
                                .data.entities.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(controller.store.myResponseModel!
                                        .value!.data.entities[index].name),
                                    ButtonsActionsWidget(
                                      name: controller.store.myResponseModel!
                                          .value!.data.entities[index].name,
                                      id: controller.store.myResponseModel!
                                          .value!.data.entities[index].id,
                                      active: controller.store.myResponseModel!
                                          .value!.data.entities[index].active,
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Offstage(
                          offstage: !(controller.store.myResponseModel!.value!
                                  .data.pagination.totalPages >
                              1),
                          child: ElevatedButton(
                            onPressed: () {
                              controller.getListClients();
                              controller.store.changePage.value =
                                  !controller.store.changePage.value!;
                            },
                            child: Text(!controller.store.changePage.value!
                                ? "Pagina 1"
                                : "Pagina 2"),
                          ),
                        ),
                      ],
                    );
                  }
                  return Container();
                }));
          }),
    );
  }
}
