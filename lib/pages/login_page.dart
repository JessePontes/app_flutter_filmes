import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final controllerLogin = TextEditingController();
  final controllerPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmes"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: formKey,
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            _textFormFieldGeneric("Login", "Digite seu login",
                controllerParameter: controllerLogin,
                validatorParametre: validateLoginFormat),
            _textFormFieldGeneric("Senha", "Digite sua senha",
                password: true, controllerParameter: controllerPassword, validatorParametre: validatePasswordFormat),
            SizedBox(height: 10),
            Container(
              color: Colors.blue,
              child: _buttonGeneric("Login", onClickLogin),
            )
          ],
        ),
      ),
    );
  }

  TextButton _buttonGeneric(String label, Function onPressedParameter) {
    return TextButton(
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      onPressed: onPressedParameter,
    );
  }

  TextFormField _textFormFieldGeneric(
    String label,
    String hint, {
    bool password = false,
    TextEditingController controllerParameter,
    FormFieldValidator<String> validatorParametre,
  }) {
    return TextFormField(
      validator: validatorParametre,
      controller: controllerParameter,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      obscureText: password,
    );
  }

  void onClickLogin() {
    String login = controllerLogin.text;
    String password = controllerPassword.text;

    bool formCorrect = formKey.currentState.validate();
    if (!formCorrect) {
      return;
    }
  }

  String validateLoginFormat(String text) {
    if (text.isEmpty) {
      return "Digite o login";
    }
    return null;
  }
}

String validatePasswordFormat(String text) {
  if (text.isEmpty) {
    return "Digite o login";
  }
  if (text.length < 6) {
    return "A senha deve conter mais de 6 caracteres";
  }
  return null;
}
