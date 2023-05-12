import 'package:flutter/material.dart';
import 'package:app_menezes/core/store.dart';
import 'package:rx_notifier/rx_notifier.dart';
import '../../../core/app_state.dart';
import '../../data/models/clients/create_response_model.dart';
import '../../data/models/clients/get_all_clients_model.dart';

class ClientStore extends Store {
  RxNotifier<AppState> state = RxNotifier(AppState());

  RxNotifier<int?> id = RxNotifier<int?>(null);
  RxNotifier<bool?> activeClient = RxNotifier<bool?>(null);
  RxNotifier<bool?> dropdownValue = RxNotifier<bool?>(null);

  RxNotifier<String?> nameClientEdit = RxNotifier<String?>(null);

  RxNotifier<GetAllClientsModel?>? myResponseModel = RxNotifier(null);
  RxNotifier<GetAllClientsModel?>? myResponseModel2 = RxNotifier(null);

  RxNotifier<CreateNewClientModel?>? createInfo = RxNotifier(null);
  String? token =
      "Bearer 40fe071962846075452a4f6123ae71697463cad20f51e237e2035b41af0513d8";
  final TextEditingController controlleTexField = TextEditingController();
  RxNotifier<String> titleDropdown = RxNotifier("Sim");
  RxNotifier<bool> boolDropdown = RxNotifier(false);
  RxNotifier<bool> isEditAlertDialog = RxNotifier(false);
  RxNotifier<bool?> buttonPage = RxNotifier<bool?>(true);
  RxNotifier<bool?> changePage = RxNotifier<bool?>(true);

  String? idd;
  bool? isDeleteClient = true;
  bool? isEditClient = true;
  bool? isNewClient = true;
  bool? formOnAlertDialog = true;
  GlobalKey<FormState>? formKey;
  TextEditingController? emailLoginController;
  TextEditingController? passwordLoginController;
  RxNotifier<String?> titulo = RxNotifier<String?>("Bem-vindo");
  RxNotifier<String?> actionButton = RxNotifier<String?>("Login");
  RxNotifier<String?> toggleButton = RxNotifier<String?>("Ainda nao tem conta, cadastre-se agora!");

  bool isLogin = true;

  String? emailText;
  String? passwordText;

  RxNotifier<bool?> isConfirmSucess = RxNotifier<bool?>(false);
}
