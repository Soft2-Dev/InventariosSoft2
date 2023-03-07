import 'dart:convert';

import 'package:admin_dashbuard/api/AllApi.dart';
import 'package:admin_dashbuard/models/http/usuarios.dart';
import 'package:admin_dashbuard/services/notificationService.dart';
import 'package:flutter/material.dart';

class UserFormProvider extends ChangeNotifier {
  Usuario? user;
  GlobalKey<FormState> fromkeyUsuario = new GlobalKey<FormState>();

  copyUserWith({
    String? id,
    String? nombre,
    String? correo,
    String? telefono,
    String? direccion,
    String? rol,
    String? img,
    String? estado,
    String? password,
    String? token,
  }) {
    user = new Usuario(
      id: id ?? this.user!.id,
      nombre: nombre ?? this.user!.nombre,
      correo: correo ?? this.user!.correo,
      telefono: telefono ?? this.user!.telefono,
      direccion: direccion ?? this.user!.direccion,
      rol: rol ?? this.user!.rol,
      img: img ?? this.user!.img,
      estado: estado ?? this.user!.estado,
      password: password ?? this.user!.password,
      token: token ?? this.user!.token,
    );
    notifyListeners();
  }

  bool _validForm() {
    return fromkeyUsuario.currentState!.validate();
  }

  updateUser(uid) async {
    if (!this._validForm()) return;

    final data = {
      'case': '7',
      'nombre': user!.nombre,
      'correo': user!.correo,
      'telefono': user!.telefono,
      'direccion': user!.direccion,
      'token': uid,
    };

    AllApi.httpPost('/FranciaApi.php', data).then((rpta) {
      final dataMap = jsonDecode(rpta);
      final Usuarios usuarios = new Usuarios.fromlist(dataMap['rpta']);
      user = usuarios.dato[0];
      NotificationService.showSnackBarExito('Datos Actualizados Exitosamente');
    }).catchError((onError) {
      print(onError.toString());
    });
  }
}
