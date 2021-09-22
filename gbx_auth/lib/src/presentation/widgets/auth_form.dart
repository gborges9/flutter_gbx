import 'package:farm_app/core/utils/validators/index.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class AuthForm extends StatelessWidget {
  AuthForm(
      {Key? key,
      this.signInMode = true,
      required this.onFinish,
      required this.onSecondaryButton,
      required this.nameController,
      required this.emailController,
      required this.passController,
      required this.cPassController,
      required this.cpfController,
      required this.phoneController,
      required this.loading})
      : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController cPassController;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController cpfController;

  final void Function()? onSecondaryButton;
  final void Function() onFinish;
  final bool signInMode;
  final bool loading;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FlutterLogo(
                  style: FlutterLogoStyle.horizontal,
                  size: 200,
                ),
                if (!signInMode)
                  TextFormField(
                    decoration: InputDecoration(labelText: "Nome Completo"),
                    keyboardType: TextInputType.name,
                    validator: nameValidator,
                    controller: nameController,
                    onEditingComplete: FocusScope.of(context).nextFocus,
                  ),
                if (!signInMode)
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "CPF",
                      hintText: "xxx.xxx.xxx.xx",
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      cpfMask(),
                    ],
                    validator: MultiValidator([
                      cpfValidator,
                      requiredValidator,
                    ]),
                    controller: cpfController,
                    onEditingComplete: FocusScope.of(context).nextFocus,
                  ),
                if (!signInMode)
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Numero",
                      hintText: "(xx) xxxxx-xxxx",
                    ),
                    keyboardType: TextInputType.phone,
                    validator:
                        MultiValidator([requiredValidator, phoneValidator]),
                    inputFormatters: [
                      phoneMask(),
                    ],
                    controller: phoneController,
                    onEditingComplete: FocusScope.of(context).nextFocus,
                  ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator:
                      MultiValidator([requiredValidator, emailValidator]),
                  controller: emailController,
                  onEditingComplete: FocusScope.of(context).nextFocus,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Senha",
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: signInMode
                      ? RequiredValidator(errorText: "Campo necessario!").call
                      : passwordValidator.call,
                  controller: passController,
                  onEditingComplete:
                      signInMode ? _submit : FocusScope.of(context).nextFocus,
                ),
                if (!signInMode)
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Confirme sua senha",
                    ),
                    inputFormatters: [],
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: cPassController,
                    validator: (v) {
                      var match =
                          MatchValidator(errorText: 'passwords do not match')
                              .validateMatch(
                                  cPassController.text, passController.text);
                      return match ?? requiredValidator.call(v);
                    },
                    onEditingComplete: _submit,
                  ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: !loading
                      ? ElevatedButton(
                          child: Text(signInMode ? "Logar" : "Criar conta"),
                          onPressed: _submit,
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: TextButton(
                      child: Text(signInMode
                          ? "Não tem uma conta? Clique aqui!"
                          : "Já tem uma conta? Clique aqui!"),
                      onPressed: onSecondaryButton),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) onFinish.call();
  }
}
