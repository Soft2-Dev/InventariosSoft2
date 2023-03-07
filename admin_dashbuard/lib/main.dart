import 'package:admin_dashbuard/provider/noticiaFromProvider.dart';
import 'package:admin_dashbuard/provider/noticisasProvider.dart';
import 'package:admin_dashbuard/provider/studentsProvider.dart';
import 'package:admin_dashbuard/provider/authProvider.dart';
import 'package:admin_dashbuard/provider/sideMenuProvide.dart';
import 'package:admin_dashbuard/provider/userFromProvider.dart';
import 'package:admin_dashbuard/provider/usuariosProvider.dart';
import 'package:admin_dashbuard/router/router.dart';
import 'package:admin_dashbuard/services/navigationService.dart';
import 'package:admin_dashbuard/services/notificationService.dart';
import 'package:admin_dashbuard/ui/layout/auth/authLayout.dart';
import 'package:admin_dashbuard/ui/layout/dashboard/dashboardLayout.dart';
import 'package:admin_dashbuard/ui/layout/pagina/homePages.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'api/AllApi.dart';
import 'provider/carrerasProvider.dart';
import 'provider/homeProvider.dart';
import 'ui/layout/splash/splashAuthLayout.dart';

void main() {
  Flurorouter.configureRoutes();
  AllApi.configuteDio();

  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('__________>ZZZZZ');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => AuthProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => SideMenuProvider()),
        ChangeNotifierProvider(create: (_) => StudentsProvider()),
        ChangeNotifierProvider(create: (_) => CarrerasProvider()),
        ChangeNotifierProvider(create: (_) => UserFormProvider()),
        ChangeNotifierProvider(create: (_) => NoticiasProvider()),
        ChangeNotifierProvider(create: (_) => NoticiaFromProvider()),
        ChangeNotifierProvider(create: (_) => UsuariosProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    String route = '';

    if (authProvider.authStatus == AuthStatus.authenticated) {
      route = '/dashboard';
    }

    if (authProvider.authStatus == AuthStatus.notAuthenticated) {
      route = '/auth/login';
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Academia Francia',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationService.msnKey,
      builder: (_, child) {
        print(authProvider.authStatus.toString() + ' ' + route + ' ');

        if (authProvider.authStatus == AuthStatus.checking) {
          return SplashAuthLayout();
        } else {
          if (authProvider.authStatus == AuthStatus.authenticated) {
            return DashboardLayout(child: child!);
          } else {
            return AuthLayout(child: child!);
          }
        }
      },
      theme: ThemeData.light().copyWith(
          scrollbarTheme: ScrollbarThemeData()
              .copyWith(thumbColor: MaterialStateProperty.all(Colors.white38))),
    );
  }
}
