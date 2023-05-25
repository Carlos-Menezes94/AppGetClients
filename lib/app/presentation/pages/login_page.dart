import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../controllers/clients_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    // controller.setFormAction(true);
    super.initState();
  }

  ClientsControler controller = GetIt.I.get<ClientsControler>();

  @override
  Widget build(BuildContext context) {
    return RxBuilder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff0bc6a5),
          title: Text(controller.store.actionButton.value!),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: controller.store.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: controller.store.emailLoginController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      controller.store.emailText = value;
                      print(value);
                    },
                    // onChanged: (value) {
                    //   controller.store.senhaLoginController!.text = value;
                    // },
                    // onSaved: (value) {
                    //   controller.store.emailLoginController!.text =
                    //       value!.trim();
                    // },
                  ),
                  TextFormField(
                    controller: controller.store.passwordLoginController,
                    obscureText: true,
                    onChanged: (value) {
                      controller.store.passwordText = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RxBuilder(builder: (context) {
                    if (controller.store.state.value.isLoading()) {
                      return CircularProgressIndicator();
                    }
                    return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff0bc6a5)),
                      ),
                      onPressed: () {
                        if (controller.store.isLogin) {
                          controller.login(context);
                        } else {
                          controller.register(context);
                        }
                      },
                      child: Text(controller.store.actionButton.value!),
                    );
                  }),
                  TextButton(
                      onPressed: () {
                        controller.setFormAction(!controller.store.isLogin);
                      },
                      child: Text(controller.store.toggleButton.value!))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
