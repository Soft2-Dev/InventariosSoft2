import 'package:admin_dashbuard/datatables/studentsDTS.dart';
import 'package:admin_dashbuard/provider/studentsProvider.dart';
import 'package:admin_dashbuard/services/navigationService.dart';
import 'package:admin_dashbuard/ui/buttons/customIconButton.dart';

import 'package:admin_dashbuard/ui/labels/customLabels.dart';
import 'package:admin_dashbuard/ui/modals/carrerasModals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentsView extends StatefulWidget {
  @override
  _StudentsViewState createState() => _StudentsViewState();
}

class _StudentsViewState extends State<StudentsView> {
  @override
  void initState() {
    super.initState();
    Provider.of<StudentsProvider>(context, listen: false).getEstudiantes();
  }

  @override
  Widget build(BuildContext context) {
    final students = Provider.of<StudentsProvider>(context);
    int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Estudiantes',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          PaginatedDataTable(
            sortAscending: students.ascending,
            sortColumnIndex: students.sortColumnIndex,
            header: Text(
              // titulo de la tabla
              'Lista de Todos los Estudiantes',
              maxLines: 2,
            ),
            actions: [
              // botones de accion
              CustomIconButton(
                text: 'Agregar Nuevo',
                icon: Icons.person_add_alt_1_outlined,
                color: Colors.green,
                onPressd: () {
                  NavigationService.navigateTo(
                      '/dashboard/registro-usuarios/${'2'}');
                },
              )
            ],

            columns: [
              // nombres de las columnas
              DataColumn(label: Text('Avatar')),
              DataColumn(
                  label: Text('Nombre'),
                  onSort: (colIndex, _) {
                    students.sortColumnIndex = colIndex;
                    students.sort<String>((user) => user.nombre!);
                  }),
              DataColumn(
                  label: Text('Correo'),
                  onSort: (colIndex, _) {
                    students.sortColumnIndex = colIndex;
                    students.sort<String>((user) => user.correo!);
                  }),
              DataColumn(
                  label: Text('Télefono'),
                  onSort: (colIndex, _) {
                    students.sortColumnIndex = colIndex;
                    students.sort<String>((user) => user.telefono!);
                  }),
              DataColumn(
                label: Text('Estado'),
                onSort: (colIndex, _) {
                  students.sortColumnIndex = colIndex;
                  students.sort<String>((user) => user.estado!);
                },
              ),
              DataColumn(label: Text('Acciones')),
            ],

            source: StudiantesDTS(
                students.estudiantes, context), //cargando datos cargados de BD

            onRowsPerPageChanged: (value) {
              // lista de opcion para carga de productos
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,

            onPageChanged: (page) {
              print(page);
            }, //limitando la cantidad de registro por pagina
          )
        ],
      ),
    );
  }
}
