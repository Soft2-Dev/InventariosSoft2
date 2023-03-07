import 'package:admin_dashbuard/provider/authProvider.dart';
import 'package:admin_dashbuard/provider/registerFromProvider.dart';
import 'package:admin_dashbuard/router/router.dart';
import 'package:admin_dashbuard/ui/buttons/customOuntlined.dart';
import 'package:admin_dashbuard/ui/buttons/linkText.dart';
import 'package:admin_dashbuard/ui/inputs/customInpunt.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthProvider>(context);
    return ChangeNotifierProvider(
        create: (_) => RegisterFromProvider(),
        child: Builder(builder: (context) {
          final registerFromProvider =
              Provider.of<RegisterFromProvider>(context, listen: false);

          return Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 100),
                padding: EdgeInsets.symmetric(horizontal: 20),
                //color: Colors.green,
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 370),
                    child: Form(
                        autovalidateMode: AutovalidateMode.always,
                        key: registerFromProvider.fromkeyRegister,
                        child: ListView(
                          children: [
                            Column(
                              children: [
                                // usuario

                                TextFormField(
                                  onChanged: (value) =>
                                      registerFromProvider.name = value,
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return 'Este campo es obligatorio';
                                    return null; //---> valido
                                  },
                                  style: TextStyle(color: Colors.white),
                                  decoration: CustomInputs.loginInputDecoration(
                                      hint: 'Ingrese su Nombre',
                                      label: 'Nombre',
                                      icon: Icons.supervised_user_circle_sharp),
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  onFieldSubmitted: (value) {
                                    _voidFromSubmit(authprovider,
                                        registerFromProvider, context);
                                  },
                                  onChanged: (value) =>
                                      registerFromProvider.email = value,
                                  validator: (value) {
                                    if (!EmailValidator.validate(value ?? ''))
                                      return 'Email no Valido ';
                                  },
                                  style: TextStyle(color: Colors.white),
                                  decoration: CustomInputs.loginInputDecoration(
                                      hint: 'Ingrese su Correo',
                                      label: 'Email',
                                      icon: Icons.email_outlined),
                                ),

                                SizedBox(
                                  height: 20,
                                ),

                                //password

                                TextFormField(
                                  onChanged: (value) =>
                                      registerFromProvider.password = value,
                                  validator: (value) {
                                    if (value == null)
                                      return 'Ingrese una Contraseña';
                                    if (value.length < 6)
                                      return 'La contraseña debe tener mas de 6 caracteres';
                                    return null; //---> valido
                                  },
                                  obscureText: true,
                                  style: TextStyle(color: Colors.white),
                                  decoration: CustomInputs.loginInputDecoration(
                                      hint: '******',
                                      label: 'Contraseña',
                                      icon: Icons.lock_outline_rounded),
                                ),

                                SizedBox(
                                  height: 20,
                                ),

                                //password

                                TextFormField(
                                  onChanged: (value) =>
                                      registerFromProvider.celular = value,
                                  validator: (value) {
                                    if (value == null)
                                      return 'Ingrese un Nuemro de Celular';
                                    if (value.length < 7)
                                      return 'Ingrese un Numero de Celular valido';
                                    return null; //---> valido
                                  },
                                  style: TextStyle(color: Colors.white),
                                  decoration: CustomInputs.loginInputDecoration(
                                      hint: '3103535353',
                                      label: 'Celular',
                                      icon: Icons.smartphone_outlined),
                                ),

                                SizedBox(
                                  height: 20,
                                ),

                                OuntlinedButton(
                                  text: 'Crear Cuenta',
                                  onPressed: () {
                                    _voidFromSubmit(authprovider,
                                        registerFromProvider, context);
                                  },
                                  isFilled: false,
                                ),

                                SizedBox(
                                  height: 20,
                                ),

                                LinkText(
                                  text: 'Ir al Login',
                                  onPressed: () {
                                    authprovider.settitle('Login');
                                    Navigator.pushReplacementNamed(
                                        context, Flurorouter.loginRoute);
                                  },
                                )
                              ],
                            ),
                          ],
                        )),
                  ),
                ),
              ),
              if (authprovider.scrim)
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black26,
                  child: Container(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
          );
        }));
  }

  _voidFromSubmit(AuthProvider authprovider,
      RegisterFromProvider registerFromProvider, BuildContext context) {
    authprovider.setscrim(true);
    final validFrom = registerFromProvider.validateFrom();
    if (!validFrom) return;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    authProvider.register(registerFromProvider.name, registerFromProvider.email,
        registerFromProvider.password, registerFromProvider.celular, '2');
  }
}
