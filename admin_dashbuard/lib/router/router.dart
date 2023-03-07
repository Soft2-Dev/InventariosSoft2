import 'package:admin_dashbuard/router/adminHandlers.dart';
import 'package:admin_dashbuard/router/dashnoardHandlers.dart';
import 'package:admin_dashbuard/router/paginaHandlers.dart';
import 'package:admin_dashbuard/router/view404Handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  // Auth Route
  static String rootRoute = '/';

  // Auth Route
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  static String dashboardRoute = '/dashboard';
  static String iconsRoute = '/dashboard/icons';
  static String blankRoute = '/dashboard/blank';
  static String studentsRoute = '/dashboard/estudiantes';
  static String studentRoute = '/dashboard/estudiantes/:uid';

  static String usuariosRoute = '/dashboard/usuarios';
  static String newUsuarioRoute = '/dashboard/registro-usuarios/:rol';

  static String carrerasRoute = '/dashboard/carreras';
  static String noticiasRoute = '/dashboard/noticias';
  static String noticiaRoute = '/dashboard/noticia';
  static String noticiaFinalRoute = '/dashboard/finalnoticia/:id';
  static String noticiaEditarRoute = '/dashboard/editarnoticia/:id';
  static String perfilRoute = '/dashboard/perfil';

  //rutas de la pagina

  static String programasRoute = '/home/programas';
  static String nosotrosRoute = '/home/nosotros';

  static void configureRoutes() {
    // manejador rupas para las paginas
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);

    router.define(programasRoute,
        handler: PaginaHandlers.programas, transitionType: TransitionType.none);

    router.define(nosotrosRoute,
        handler: PaginaHandlers.nosotros, transitionType: TransitionType.none);

    // router login
    router.define(loginRoute,
        handler: AdminHandlers.login,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 100));

    // router registro
    router.define(registerRoute,
        handler: AdminHandlers.register,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 100));

    //router dashboard
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboardMain,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    //router perfil
    router.define(perfilRoute,
        handler: DashboardHandlers.perfil,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router icons
    router.define(iconsRoute,
        handler: DashboardHandlers.icons,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router usuarios
    router.define(usuariosRoute,
        handler: DashboardHandlers.usuarios,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router usuarios
    router.define(newUsuarioRoute,
        handler: DashboardHandlers.newUsuarios,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router estudiantes
    router.define(studentsRoute,
        handler: DashboardHandlers.students,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router id estudiantes
    router.define(studentRoute,
        handler: DashboardHandlers.user,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router cursos
    router.define(carrerasRoute,
        handler: DashboardHandlers.carreras,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router noticias
    router.define(noticiasRoute,
        handler: DashboardHandlers.noticias,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router noticia
    router.define(noticiaRoute,
        handler: DashboardHandlers.noticia,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router final noticia
    router.define(noticiaFinalRoute,
        handler: DashboardHandlers.noticiaFinal,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router editar noticia
    router.define(noticiaEditarRoute,
        handler: DashboardHandlers.noticiaEditarFinal,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router blank
    router.define(blankRoute,
        handler: DashboardHandlers.blank,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    //page 404

    router.notFoundHandler = View404Handlers.view404;
  }
}
