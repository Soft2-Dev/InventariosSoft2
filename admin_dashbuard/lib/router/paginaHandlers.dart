import 'package:admin_dashbuard/ui/views/pagina/homeView.dart';
import 'package:admin_dashbuard/ui/views/pagina/nosotrosView.dart';
import 'package:admin_dashbuard/ui/views/pagina/programasView.dart';
import 'package:fluro/fluro.dart';

class PaginaHandlers {
  static Handler home = new Handler(handlerFunc: (context, params) {
    return HomeView();
  });

  static Handler programas = new Handler(handlerFunc: (context, params) {
    return ProgramasView();
  });

  static Handler nosotros = new Handler(handlerFunc: (context, params) {
    return NosotrosView();
  });
}
