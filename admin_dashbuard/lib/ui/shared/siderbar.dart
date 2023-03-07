import 'package:admin_dashbuard/provider/authProvider.dart';
import 'package:admin_dashbuard/provider/sideMenuProvide.dart';
import 'package:admin_dashbuard/router/router.dart';
import 'package:admin_dashbuard/services/localStorage.dart';
import 'package:admin_dashbuard/services/navigationService.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashbuard/ui/shared/widgets/logo.dart';
import 'package:admin_dashbuard/ui/shared/widgets/textSeparator.dart';
import 'package:provider/provider.dart';

import 'widgets/menuItems.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  void _navigateTo(String rutename) {
    NavigationService.replaceTo(rutename);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);
    final rol = LocalStorage.prefs.getString('rol');
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          // logo de la empresa
          Logo(),
          SizedBox(
            height: 50,
          ),

          // suptitulos
          TextSeparator(text: 'Administrativo'),
          // menu Items
          if (rol != '2')
            MenuItems(
              text: 'DashBoard',
              icon: Icons.dashboard_outlined,
              onPressd: () => _navigateTo(Flurorouter.dashboardRoute),
              isActive:
                  sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
            ),

          if (rol != '2')
            MenuItems(
              text: 'Usuarios',
              icon: Icons.school_outlined,
              onPressd: () => _navigateTo(Flurorouter.usuariosRoute),
              isActive:
                  sideMenuProvider.currentPage == Flurorouter.usuariosRoute,
            ),

          if (rol != '2')
            MenuItems(
              text: 'Estudiantes',
              icon: Icons.school_outlined,
              onPressd: () => _navigateTo(Flurorouter.studentsRoute),
              isActive:
                  sideMenuProvider.currentPage == Flurorouter.studentsRoute,
            ),

          MenuItems(
            text: 'Noticias',
            icon: Icons.notifications_active_outlined,
            onPressd: () => _navigateTo(Flurorouter.noticiasRoute),
            isActive: sideMenuProvider.currentPage == Flurorouter.noticiasRoute,
          ),

          if (rol == '2') TextSeparator(text: 'Cuenta'),
          if (rol == '2')
            MenuItems(
              text: 'Mi Perfil',
              icon: Icons.person_outline_outlined,
              onPressd: () => _navigateTo(Flurorouter.perfilRoute),
              isActive:
                  sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
            ),

          /*MenuItems(
              text: 'Analytic',
              icon: Icons.show_chart_outlined,
              isActive: false,
              onPressd: () => print('Analytic')),

          MenuItems(
              text: 'Categories',
              icon: Icons.layers_outlined,
              isActive: false,
              onPressd: () => print('Categories')),

          MenuItems(
              text: 'Products',
              icon: Icons.dashboard_outlined,
              isActive: false,
              onPressd: () => print('Products')),

          MenuItems(
              text: 'Discount',
              icon: Icons.attach_money_outlined,
              isActive: false,
              onPressd: () => print('Discount')),

          MenuItems(
              text: 'Customers',
              icon: Icons.people_alt_outlined,
              isActive: false,
              onPressd: () => print('Customers')),
*/
          if (rol != '2')
            SizedBox(
              height: 30,
            ),
          if (rol != '2') TextSeparator(text: 'Academico'),
          if (rol != '2')
            MenuItems(
                isActive:
                    sideMenuProvider.currentPage == Flurorouter.iconsRoute,
                text: 'Carreras',
                icon: Icons.list_alt_outlined,
                onPressd: () => _navigateTo(Flurorouter.carrerasRoute)),

          // suptitulos
          /* TextSeparator(text: 'Ui Elements'),

          MenuItems(
              isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute,
              text: 'Icons',
              icon: Icons.list_alt_outlined,
              onPressd: () => _navigateTo(Flurorouter.iconsRoute)),

          MenuItems(
              text: 'Marketing',
              icon: Icons.mark_email_read_outlined,
              isActive: false,
              onPressd: () => print('Orders')),

          MenuItems(
              text: 'Campaing',
              icon: Icons.note_add_outlined,
              isActive: false,
              onPressd: () => print('Analytic')),

          MenuItems(
              isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute,
              text: 'Black',
              icon: Icons.post_add_outlined,
              onPressd: () => _navigateTo(Flurorouter.blankRoute)),

          SizedBox(
            height: 50,
          ),
          */
          // suptitulos

          TextSeparator(text: 'Exit'),

          MenuItems(
              text: 'Logout',
              icon: Icons.exit_to_app_outlined,
              isActive: false,
              onPressd: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
              }),
        ],
      ),
    );
  }

  BoxDecoration buildDecoration() => BoxDecoration(
      gradient: LinearGradient(colors: [Color(0xff092044), Color(0xff092043)]),
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]);
}
