import 'package:admin_dashbuard/api/AllApi.dart';
import 'package:admin_dashbuard/models/http/usuarios.dart';

import 'package:admin_dashbuard/services/navigationService.dart';
import 'package:flutter/material.dart';

class StudiantesDTS extends DataTableSource {
  final List<Usuario> students;
  final BuildContext context;

  StudiantesDTS(this.students, this.context);

  final url = AllApi.url;

  @override
  DataRow getRow(int index) {
    final student = this.students[index];
    final image = (student.img != null)
        ? Image.network('/documentos/' + student.img!)
        : Image(
            image: AssetImage('img/no-image.jpg'),
            width: 35,
            height: 35,
          );

    return DataRow.byIndex(index: index, cells: [
      DataCell(ClipOval(
        child: image,
      )),
      DataCell(Text(student.nombre!)),
      DataCell(Text(student.correo!)),
      DataCell(Text(student.telefono!)),
      DataCell(Text(
        student.estado!,
      )),
      DataCell(Row(
        children: [
          IconButton(
              // editar estudiantes
              color: Colors.blue,
              icon: Icon(Icons.edit_outlined),
              onPressed: () {
                NavigationService.replaceTo(
                    '/dashboard/estudiantes/${this.students[index].token}');
              }),
          IconButton(
              // inactivar estudiantes
              color: Colors.red[400],
              icon: Icon(Icons.delete_outline),
              onPressed: () {
                final dialog = AlertDialog(
                  title: Text('¿Desea Inactivar este Estudiante?'),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Inactivar ${student.nombre}')
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Si, Inactivar')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('No')),
                  ],
                );
                showDialog(context: context, builder: (_) => dialog);
              })
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => students.length;

  @override
  int get selectedRowCount => 0;
}
