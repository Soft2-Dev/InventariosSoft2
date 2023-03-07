import 'package:admin_dashbuard/datatables/carrerasDTS.dart';
import 'package:admin_dashbuard/provider/carrerasProvider.dart';
import 'package:admin_dashbuard/ui/buttons/customIconButton.dart';
import 'package:admin_dashbuard/ui/labels/customLabels.dart';
import 'package:admin_dashbuard/ui/modals/carrerasModals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarrerasView extends StatefulWidget {
  @override
  _CarrerasViewState createState() => _CarrerasViewState();
}

class _CarrerasViewState extends State<CarrerasView> {
  @override
  void initState() {
    super.initState();
    Provider.of<CarrerasProvider>(context, listen: false).getCarrera('3');
  }

  @override
  Widget build(BuildContext context) {
    final carreras = Provider.of<CarrerasProvider>(context).carreras;
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
            'Carreras',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          PaginatedDataTable(
            header: Text(
              // titulo de la tabla
              'Lista de Carreras',
              maxLines: 2,
            ),

            actions: [
              // botones de accion
              CustomIconButton(
                text: 'Agregar Nueva Carrera',
                icon: Icons.person_add_alt_1_outlined,
                color: Colors.green,
                onPressd: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (_) => CarreraModals(
                            carrera: null,
                          ));
                },
              )
            ],

            columns: [
              // nombres de las columnas
              DataColumn(label: Text('Id')),
              DataColumn(label: Text('Carrera')),
              DataColumn(label: Text('Descripción')),
              DataColumn(label: Text('Estado')),
              DataColumn(label: Text('Acciones')),
            ],

            source: CarrerasDTS(carreras, context), //datos cargados de BD

            onRowsPerPageChanged: (value) {
              // lista de opcion para carga de productos
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage:
                _rowsPerPage, //limitando la cantidad de registro por pagina
          )
        ],
      ),
    );
  }
}
