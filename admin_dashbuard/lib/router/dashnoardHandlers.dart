import 'package:admin_dashbuard/provider/authProvider.dart';
import 'package:admin_dashbuard/provider/sideMenuProvide.dart';
import 'package:admin_dashbuard/router/router.dart';
import 'package:admin_dashbuard/services/localStorage.dart';
import 'package:admin_dashbuard/ui/views/auth/loginView.dart';

import 'package:admin_dashbuard/ui/views/rolUsuario/PerfilView.dart';
import 'package:admin_dashbuard/ui/views/blankView.dart';
import 'package:admin_dashbuard/ui/views/dashboardView.dart';
import 'package:admin_dashbuard/ui/views/iconsView.dart';

import 'package:admin_dashbuard/ui/views/rolUsuario/noticiasViewUsuario.dart';
import 'package:admin_dashbuard/ui/views/roladmin/CarrerasView.dart';
import 'package:admin_dashbuard/ui/views/roladmin/newUsuarios.dart';
import 'package:admin_dashbuard/ui/views/roladmin/noticiaEditar.dart';
import 'package:admin_dashbuard/ui/views/roladmin/noticiaFinalView.dart';
import 'package:admin_dashbuard/ui/views/roladmin/noticiaView.dart';
import 'package:admin_dashbuard/ui/views/roladmin/noticiasView.dart';
import 'package:admin_dashbuard/ui/views/roladmin/studentsView.dart';
import 'package:admin_dashbuard/ui/views/roladmin/studentView.dart';
import 'package:admin_dashbuard/ui/views/roladmin/usuariosView.dart';

import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  // manejador de dashboard
  static Handler dashboardMain = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return DashboardView();
    else
      return LoginView();
  });

  // manejador de dashboard
  static Handler perfil = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      final token = LocalStorage.prefs.getString('token')!;
      return PerfilView(
        uid: token,
      );
    } else
      return LoginView();
  });

  // manejador de Icons
  static Handler icons = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.iconsRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return IconsView();
    else
      return LoginView();
  });

  // manejador de usuarios
  static Handler usuarios = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.usuariosRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return UsuariosView();
    else
      return LoginView();
  });

  // manejador de Nuevo usuarios
  static Handler newUsuarios = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.newUsuarioRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return NewUsuarios(rol: params['rol']!.first);
    else
      return LoginView();
  });

  // manejador de students
  static Handler students = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.studentsRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return StudentsView();
    else
      return LoginView();
  });

  // manejador de blank
  static Handler blank = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.blankRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return BlankView();
    else
      return LoginView();
  });

  // manejador de cursos
  static Handler carreras = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.carrerasRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return CarrerasView();
    else
      return LoginView();
  });

  // manejador de noticias
  static Handler noticias = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    final rol = LocalStorage.prefs.getString('rol');
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.noticiasRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return (rol == '1') ? NoticiasView() : NoticiasViewUsuario();
    else
      return LoginView();
  });

  static Handler noticia = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.noticiaRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return NoticiaView();
    else
      return LoginView();
  });

  static Handler noticiaFinal = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.noticiaFinalRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return NoticiaFinalView(id: params['id']!.first);
    else
      return LoginView();
  });

  static Handler noticiaEditarFinal =
      new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.noticiaEditarRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return NoticiaEditarView(id: params['id']!.first);
    else
      return LoginView();
  });

  // manejador de cursos
  static Handler user = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.studentRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      if (params['uid']?.first != null) {
        return StudentView(uid: params['uid']!.first);
      } else {
        return StudentsView();
      }
    } else
      return LoginView();
  });
}
