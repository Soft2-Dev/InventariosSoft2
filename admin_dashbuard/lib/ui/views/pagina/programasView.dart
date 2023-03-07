import 'package:admin_dashbuard/models/http/carrerasModels.dart';
import 'package:admin_dashbuard/provider/carrerasProvider.dart';
import 'package:admin_dashbuard/ui/labels/customLabels.dart';
import 'package:admin_dashbuard/ui/shared/widgets/pagina/fotter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgramasView extends StatelessWidget {
  const ProgramasView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final carreras = Provider.of<CarrerasProvider>(context).carreras;
    return Container(
      child: ListView(
        children: [
          _Titulo(
            size: size,
          ),
          _Programas(carreras: carreras),
          Container(
            width: double.infinity,
            //color: Colors.green,
            padding: EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: Footer(),
          )
        ],
      ),
    );
  }
}

class _Programas extends StatelessWidget {
  const _Programas({
    Key? key,
    required this.carreras,
  }) : super(key: key);

  final List<Carrera> carreras;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Wrap(
          children: List.generate(carreras.length, (index) {
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: (size.width > 1400)
              ? _DestockProgramas(size: size, carreras: carreras, index: index)
              : _MovilProgramas(size: size, carreras: carreras, index: index),
        );
      })),
    );
  }
}

class _MovilProgramas extends StatelessWidget {
  const _MovilProgramas({
    Key? key,
    required this.size,
    required this.carreras,
    required this.index,
  }) : super(key: key);

  final Size size;
  final int index;
  final List<Carrera> carreras;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)]),
      width: size.width * 0.9,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: Text(
              carreras[index].carrera!,
              style: CustomLabels.h3,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //color: Colors.amber,
                width: (size.width < 700 && size.width > 500)
                    ? 350
                    : (size.width < 500)
                        ? 250
                        : 350,
                height: (size.width < 700 && size.width > 500)
                    ? 350
                    : (size.width < 500)
                        ? 250
                        : 350,
                child: Image.network(
                  carreras[index].img!,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 20),
                height: 550,
                child: Text(
                  carreras[index].descripcion!,
                  style: CustomLabels.h2,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _DestockProgramas extends StatelessWidget {
  const _DestockProgramas({
    Key? key,
    required this.size,
    required this.carreras,
    required this.index,
  }) : super(key: key);

  final Size size;
  final int index;
  final List<Carrera> carreras;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)]),
      width: size.width * 0.7,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: Text(
              carreras[index].carrera!,
              style: CustomLabels.h3,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //color: Colors.amber,
                width: 450,
                height: 450,
                child: Image.network(
                  carreras[index].img!,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Container(
                alignment: Alignment.centerLeft,
                //color: Colors.blue,
                width: size.width * 0.35,

                child: Text(
                  carreras[index].descripcion!,
                  style: CustomLabels.h2,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      height: 40,
      decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xff1f7dc1), Color(0xff33a4e1)]),
      ),
      padding:
          EdgeInsets.only(left: size.width * 0.20, right: size.width * 0.20),
      child: Text(
        'Nuestros Programas',
        style: (size.width < 865) ? CustomLabels.p3m : CustomLabels.p3,
        textAlign: TextAlign.center,
      ),
    );
  }
}
