
import 'package:app_menezes/app/domain/usecases/delete_client_use_case.dart';
import 'package:app_menezes/app/domain/usecases/put_info_client_use_case.dart';
import 'package:app_menezes/core/controller.dart';
import 'package:app_menezes/app/domain/usecases/get_all_clients_use_case.dart';
import 'package:app_menezes/app/presentation/stores/clients_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../core/app_state.dart';
import '../../data/models/clients/create_response_model.dart';
import '../../data/models/clients/edit_info_client_model.dart';
import '../../domain/usecases/create_client_use_case.dart';
import '../../services/auth_service.dart';
import '../widgets/form_info_widget.dart';

class ClientsControler extends Controller {
  final ClientStore store;
  final GetAllClientsUseCase _getAllClientsUseCase;
  final CreateClientUseCase _creatInfoDataUseCase;
  final DeleteClientUseCase _deleteClientUseCase;
  final PutInfoClientUseCase _putInfoClientUseCase;
  ClientsControler({
    required GetAllClientsUseCase getAllClientsUseCase,
    required this.store,
    required CreateClientUseCase creatInfoDataUseCase,
    required DeleteClientUseCase deleteClientUseCase,
    required PutInfoClientUseCase putInfoClientUseCase,
  })  : _putInfoClientUseCase = putInfoClientUseCase,
        _deleteClientUseCase = deleteClientUseCase,
        _creatInfoDataUseCase = creatInfoDataUseCase,
        _getAllClientsUseCase = getAllClientsUseCase;
  AuthService authService = GetIt.I.get<AuthService>();

  Future<void> getListClients() async {
    store.state.value = AppState.loading();

    final response = await _getAllClientsUseCase.getListClients(
        store.id.value, store.changePage.value);

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

    final response = await _creatInfoDataUseCase.creatInfoData(data: data);

    response.fold((failure) {
      print(failure.message);
    }, (userAccountModel) {
      Navigator.of(context!).pop();

      store.isConfirmSucess.value = true;
      Future.delayed(Duration(seconds: 2), () {
        store.changePage.value = !store.changePage.value!;
        getListClients();
        store.isConfirmSucess.value = false;
      });
    });
  }

  Future<void> deleteClient(BuildContext? context) async {
    final response =
        await _deleteClientUseCase.deleteClient(id: int.parse(store.idd!));

    response.fold((failure) {
      print(failure.message);
    }, (userAccountModel) {
      Navigator.of(context!).pop();

      store.isConfirmSucess.value = true;
      Future.delayed(Duration(seconds: 2), () async {
        store.changePage.value = !store.changePage.value!;
        await getListClients();
        store.isConfirmSucess.value = false;
      });
    });
  }

  Future<void> editInfoClient(BuildContext? context) async {
    EditInfoModel data = EditInfoModel(
      name: store.controlleTexField.text,
      active: store.dropdownValue.value! ? 1 : 0,
    );

    final response = await _putInfoClientUseCase.putInfoClient(
        data: data, id: int.parse(store.idd!));
    response.fold((failure) {
      print(failure.message);
    }, (userAccountModel) {
      Navigator.of(context!).pop();

      store.isConfirmSucess.value = true;
      Future.delayed(Duration(seconds: 2), () {
        store.changePage.value = !store.changePage.value!;
        getListClients();
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
    store.isEditAlertDialog.value = false;
    store.isEditClient = false;
    store.isNewClient = false;

    AlertDialogFormWidget().showAddDialog(context);
  }

  void callButtonEditClient(BuildContext context) {
    store.isEditAlertDialog.value = true;
    store.isNewClient = false;

    store.isDeleteClient = false;
    store.isEditClient = true;
    AlertDialogFormWidget().showAddDialog(context);
  }

  void callButtonNewClient(BuildContext context) {
    store.isEditAlertDialog.value = false;

    store.controlleTexField.text = "";

    store.isNewClient = true;

    store.isDeleteClient = false;
    store.isEditClient = false;
    AlertDialogFormWidget().showAddDialog(context);
  }

  void pageTwoClients() {
    if (store.myResponseModel!.value!.data.entities.length > 10) {}
  }

  void setFormAction(bool action) {    

    store.isLogin = action;
    if (store.isLogin) {
      store.titulo.value = "Bem-vindo";
      store.actionButton.value = "Login";
      store.toggleButton.value = "Ainda nao tem conta, cadastre-se agora!";
    } else {
      store.titulo.value = "Crie sua conta";
      store.actionButton.value = "Cadastrar";
      store.toggleButton.value = "Voltar ao Login";
    }
  }

  void login(BuildContext context) async {
    store.state.value = AppState.loading();

    try {
      await authService.login(
        store.passwordText!,
        store.emailText!,context
      );
    } catch (e) {
      store.state.value = AppState.error();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Erro")));
    }
  }

  void register(BuildContext? context) {
    try {
      authService.register(
        store.passwordText!,
        store.emailText!,
      );
    } catch (e) {
      ScaffoldMessenger.of(context!)
          .showSnackBar(SnackBar(content: Text("Erro")));
    }
  }

  void logout(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
    });
    authService.logout(context);
  }
}
