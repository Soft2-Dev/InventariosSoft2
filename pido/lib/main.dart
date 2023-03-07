import 'package:flutter/material.dart';
import 'package:pido/router/routers.dart';
import 'package:pido/serices/notificationService.dart';
import 'package:pido/ui/construcion_page.dart';
import 'package:provider/provider.dart';

import 'api/AllApi.dart';
import 'api/splashAuthLayout.dart';
import 'provider/categoriasProvider.dart';
import 'provider/productos/productoProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AllApi.configuteDio();

  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //print('__________>ZZZZZ');
    return MultiProvider(
      providers: [
        //--------- provider login --------------
        ChangeNotifierProvider(
            lazy: false, create: (_) => ProviderCategorias()),

        ChangeNotifierProvider(lazy: false, create: (_) => ProviderProductos()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop',
      home: SplashScreenPage(),
      initialRoute: 'homes',
      routes: getRutas(),
      scaffoldMessengerKey: NotificationService.msnKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => Construccion());
      },
    );
  }
}
