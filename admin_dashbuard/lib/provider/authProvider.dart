import 'dart:convert';

import 'package:admin_dashbuard/api/AllApi.dart';
import 'package:admin_dashbuard/models/http/usuarios.dart';
import 'package:admin_dashbuard/router/router.dart';
import 'package:admin_dashbuard/services/localStorage.dart';
import 'package:admin_dashbuard/services/navigationService.dart';
import 'package:admin_dashbuard/services/notificationService.dart';
import 'package:flutter/material.dart';

import 'package:dbcrypt/dbcrypt.dart';

enum AuthStatus { checking, authenticated, notAuthenticated, nulo }

class AuthProvider extends ChangeNotifier {
  AuthStatus authStatus = AuthStatus.checking;

  bool scrim = false;
  String? _token;
  Usuario? user;
  String? _title;
  Usuarios? usuarios;

  AuthProvider() {
    this._title = 'Login';

    isAuthnticated();
  }

  void settitle(String title) {
    this._title = title;
    notifyListeners();
  }

  void setscrim(bool title) {
    this.scrim = true;
    notifyListeners();
  }

  String get gettitle => _title!;

  login(String email, String password) {
    final data = {
      'case': '2',
      'correo': email,
    };

    AllApi.httpPost('/FranciaApi.php', data).then((rpta) {
      final dataMap = jsonDecode(rpta);

      final Usuarios usuarios = new Usuarios.fromlist(dataMap['rpta']);
      this.usuarios = usuarios;
      _isValidaEstado(usuarios, password);
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  void _isValidaEstado(Usuarios usuarios, String password) {
    if (usuarios.dato[0].estado == 'NoExiste') {
      NotificationService.showSnackBarError(
          'Usuario No Esta Registrado en Nuestra Base de Datos');
    } else {
      if (usuarios.dato[0].estado == 'activo') {
        this.user = usuarios.dato[0];
        final String bd = usuarios.dato[0].password.toString();
        final bool isCorrect = new DBCrypt().checkpw(password, bd);
        if (isCorrect) {
          this._token = usuarios.dato[0].token;
          NotificationService.showSnackBarExito(
              'Bienvenido ' + usuarios.dato[0].nombre.toString());

          LocalStorage.prefs.setString('token', this._token!);
          LocalStorage.prefs.setString('rol', usuarios.dato[0].rol!);

          authStatus = AuthStatus.authenticated;

          if (usuarios.dato[0].rol == '1') {
            NavigationService.replaceTo(Flurorouter.dashboardRoute);
          } else {
            NavigationService.replaceTo(Flurorouter.noticiasRoute);
          }
        } else {
          NotificationService.showSnackBarError(
              'Usuario y/o Contraseña errada');
        }
      } else if (usuarios.dato[0].estado == 'pendiente') {
        NotificationService.showSnackBarIfo(
            'La Cuenta Asociada A Este Correo No Se A Verificado Por Favor Ingrese Al Link Enviado A Su Correo Para Activarla');
      } else if (usuarios.dato[0].estado == 'inactivo') {
        NotificationService.showSnackBarIfo(
            'Cuenta Inactiva Por Favor Comuníquese Con Administración');
      }
    }
    scrim = false;
    notifyListeners();
  }

  register(
      String name, String email, String password, String telefono, String rol) {
    final String encrip = new DBCrypt()
        .hashpw(password, new DBCrypt().gensalt()); // encripcatndo contraseña
    final data = {
      'case': '1',
      'nombre': name,
      'correo': email,
      'telefono': telefono,
      'direccion': '',
      'rol': rol,
      'password': encrip,
    };

    AllApi.httpPost('/FranciaApi.php', data).then((rpta) {
      final dataMap = jsonDecode(rpta);
      final Usuarios usuarios = new Usuarios.fromlist(dataMap['rpta']);
      if (usuarios.dato[0].token != 'existe') {
        this._token = usuarios.dato[0].token;
        //print(usuarios.dato[0].token);
        _eviarEmail(email, name);
      } else {
        NotificationService.showSnackBarError(
            'Ya Existe una Cuenta Asociada a esta Dirección de Correo Electrónico');
      }
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  Future<bool> isAuthnticated() async {
    print('------------->');
    await LocalStorage.configurePrefs();
    final token = LocalStorage.prefs.getString('token');
    final home = LocalStorage.prefs.getString('home');
    if (token == null) {
      //final token = LocalStorage.prefs.getString('token');
      //NavigationService.replaceTo(Flurorouter.rootRoute);

      if (home == null) {
        authStatus = AuthStatus.notAuthenticated;
      } else {
        authStatus = AuthStatus.authenticated;
      }

      notifyListeners();
      return false;
    }

    final data = {
      'case': '3',
      'token': token,
    };
    await Future.delayed(Duration(milliseconds: 1000));
    AllApi.httpPost('/FranciaApi.php', data).then((rpta) {
      final dataMap = jsonDecode(rpta);
      final Usuarios usuarios = new Usuarios.fromlist(dataMap['rpta']);
      this.user = usuarios.dato[0];
      authStatus = AuthStatus.authenticated;
      notifyListeners();
    }).catchError((onError) {
      print(onError.toString());
    });

    return true;
  }

  void _eviarEmail(String email, String name) {
    final data = {
      'nombre': name,
      'correo': email,
      'token': this._token,
    };
    AllApi.httpPost('/correo/email.php', data).then((rpta) {
      NotificationService.showSnackBarExito(
          'Se Envío un Correo Electrónico con un Enlace de Activación para Cuenta');
    }).catchError((onError) {
      // mostrar notificacion de error o tomar una decicion
      print(onError.toString());
    });
    scrim = false;
    notifyListeners();
  }

  logout() {
    LocalStorage.prefs.remove('token');
    LocalStorage.prefs.remove('rol');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }

  loguin() {
    LocalStorage.prefs.setString('home', '1');
    authStatus = AuthStatus.notAuthenticated;
    NavigationService.replaceTo(Flurorouter.loginRoute);
    notifyListeners();
  }
}

//LocalStorage.prefs.getString('token');
