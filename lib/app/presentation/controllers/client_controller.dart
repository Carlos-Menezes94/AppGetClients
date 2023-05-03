import 'package:app_menezes/core/controller.dart';
import 'package:app_menezes/app/domain/usecases/get_all_clients_use_case.dart';
import 'package:app_menezes/app/presentation/stores/client_store.dart';
import 'package:flutter/material.dart';
import '../../../core/app_state.dart';
import '../../../core/failure.dart';
import '../../data/models/clients/create_response_model.dart';
import '../../domain/usecases/create_cliente_use_case.dart';
import '../widgets/form_info_widget.dart';

class ClientControler extends Controller {
  final ClientStore store;
  final InfoUseCase infoUseCase;
  final CreateClientUseCase creatInfoDataUseCase;
  ClientControler(
      {required this.infoUseCase,
      required this.store,
      required this.creatInfoDataUseCase});

  Future<void> getListClients() async {
    store.state.value = AppState()..setLoading();
    final response = await infoUseCase.getListClients(store.id.value);

    response.fold((failure) {
      store.state.value = AppState()..setSuccess();
    }, (userAccountModel) {
      store.myResponseModel!.value = userAccountModel;
      store.state.value = AppState()..setSuccess();
    });
  }

  Future<void> createInfo(BuildContext? context) async {
    CreateNewClientModel data = CreateNewClientModel(
        name: store.controlleTexField.text,
        active: store.boolDropdown.value ? 1 : 0,
        id: null);

    final response = await creatInfoDataUseCase.creatInfoData(data: data);

    response.fold((failure) {
      print(failure.message);
    }, (userAccountModel) {
      // store.createInfo!.value = userAccountModel;
      print(userAccountModel);
      getListClients();
      Navigator.of(context!).pop();
    });
  }

  void isActiveDropdown() {
    if (store.boolDropdown.value) {
      store.titleDropdown.value = "Sim";
    } else {
      store.titleDropdown.value = "Não";
    }
  }

  Future<void> refresh() async {
    getListClients();
  }

  void deleteClient(BuildContext context) {
    store.isDeleteClient = true;

    store.isEditClient = false;
    store.isNewClient = false;

    AlertDialogFormWidget().showAddDialog(context);
  }

  void editClient(BuildContext context) {
    store.isEditClient = true;

    store.isDeleteClient = false;
    store.isNewClient = false;
    AlertDialogFormWidget().showAddDialog(context);
  }

  void newClient(BuildContext context) {
    store.isNewClient = true;

    store.isDeleteClient = false;
    store.isEditClient = false;
    AlertDialogFormWidget().showAddDialog(context);
  }

  void registerErrorState(Failure failure) {
    store.value = failure.message;
    store.state.value = AppState()..setError();
  }
}
