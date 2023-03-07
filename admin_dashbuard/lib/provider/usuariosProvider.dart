import 'dart:convert';

import 'package:admin_dashbuard/api/AllApi.dart';
import 'package:admin_dashbuard/models/http/usuarios.dart';
import 'package:flutter/material.dart';

class UsuariosProvider extends ChangeNotifier {
  List<Usuario> estudiantes = [];
  bool ascending = true;
  int? sortColumnIndex;

  getUsuarios() async {
    final resp = await AllApi.httpGet('/FranciaApi.php?case=1&rol=1');
    final dataMap = jsonDecode(resp);
    final Usuarios usuarios = new Usuarios.fromlist(dataMap['rpta']);
    estudiantes = usuarios.dato;
    //print(this.estudiantes);
    notifyListeners();
  }

  void sort<T>(Comparable<T> Function(Usuario user) getField) {
    estudiantes.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);

      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    ascending = !ascending;
    notifyListeners();
  }
}
