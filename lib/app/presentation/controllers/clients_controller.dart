import 'package:app_menezes/app/domain/usecases/delete_client_use_case.dart';
import 'package:app_menezes/core/controller.dart';
import 'package:app_menezes/app/domain/usecases/get_all_clients_use_case.dart';
import 'package:app_menezes/app/presentation/stores/clients_store.dart';
import 'package:flutter/material.dart';
import '../../../core/app_state.dart';
import '../../data/models/clients/create_response_model.dart';
import '../../domain/usecases/create_client_use_case.dart';
import '../widgets/form_info_widget.dart';

class ClientsControler extends Controller {
  final ClientStore store;
  final GetAllClientsUseCase getAllClientsUseCase;
  final CreateClientUseCase creatInfoDataUseCase;
  final DeleteClientUseCase deleteClientUseCase;
  ClientsControler({
    required this.getAllClientsUseCase,
    required this.store,
    required this.creatInfoDataUseCase,
    required this.deleteClientUseCase,
  });

  Future<void> getListClients() async {
    store.state.value = AppState.loading();

    final response = await getAllClientsUseCase.getListClients(store.id.value);

    response.fold((failure) {
      store.state.value = AppState.error();
    }, (userAccountModel) {
      store.myResponseModel!.value = userAccountModel;
      store.state.value = AppState.success();
    });
  }

  Future<void> createInfo(BuildContext? context) async {
    CreateNewClientModel data = CreateNewClientModel(
        name: store.controlleTexField.text,
        active: store.dropdownValue.value! ? 1 : 0,
        id: null);

    final response = await creatInfoDataUseCase.creatInfoData(data: data);

    response.fold((failure) {
      print(failure.message);
    }, (userAccountModel) {
      getListClients();
      Navigator.of(context!).pop();
    });
  }

  Future<void> deleteClient(BuildContext? context) async {
    final response =
        await deleteClientUseCase.deleteClient(id: int.parse(store.idd!));

    response.fold((failure) {
      print(failure.message);
    }, (userAccountModel) {
      Navigator.of(context!).pop();

      store.isConfirmSucess.value = true;
      Future.delayed(Duration(seconds: 2), () async {
        await getListClients();
        store.isConfirmSucess.value = false;
      });
    });
  }

  void isActiveDropdown() {
    if (store.boolDropdown.value) {
      store.titleDropdown.value = "Sim";
    } else {
      store.titleDropdown.value = "Não";
    }
  }

  void callButtonDeleteClient(BuildContext context) {
    store.isDeleteClient = true;

    store.isEditClient = false;
    store.isNewClient = false;

    AlertDialogFormWidget().showAddDialog(context);
  }

  void callButtonEditClient(BuildContext context) {
    store.isTitleEditAlertDialog.value = true;
    store.isNewClient = true;

    store.isDeleteClient = false;
    store.isEditClient = false;
    AlertDialogFormWidget().showAddDialog(context);
  }

  void callButtonNewClient(BuildContext context) {
    store.isTitleEditAlertDialog.value = false;

    store.controlleTexField.text = "";

    store.isNewClient = true;

    store.isDeleteClient = false;
    store.isEditClient = false;
    AlertDialogFormWidget().showAddDialog(context);
  }

  void pageTwoClients() {
    if (store.myResponseModel!.value!.entities.length > 10) {}
  }
}
