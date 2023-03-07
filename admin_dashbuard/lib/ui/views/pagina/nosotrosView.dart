import 'package:admin_dashbuard/ui/labels/customLabels.dart';
import 'package:admin_dashbuard/ui/shared/widgets/pagina/fotter.dart';
import 'package:flutter/material.dart';

class NosotrosView extends StatelessWidget {
  const NosotrosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: ListView(
        children: [
          Container(
            width: 600,
            height: 200,
            child: Image(image: AssetImage('img/logonegro.png')),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            //color: Colors.pink,
            width: size.width * 0.8,
            child: Column(
              children: [
                (size.width < 600)
                    ? _QuienesSomosMovil(
                        size: size,
                      )
                    : _QuienesSomos(size: size),
                (size.width < 600)
                    ? _MisionVisionMovil(
                        size: size,
                      )
                    : _MisionVision(size: size),
                (size.width < 600)
                    ? _PoliticaMovil(
                        size: size,
                      )
                    : _Politica(size: size)
              ],
            ),
          ),
          Spacer(),
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

class _Politica extends StatelessWidget {
  const _Politica({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Politica de Calidad',
          style: CustomLabels.h3,
        ),
        Container(
          width: size.width * 0.5,
          child: Text(
            'La Corporación Educativa Francia es una Institución de Educación para el trabajo y el desarrollo humano que forma técnicos laborales por competencia en estética ornamental por medio de brigadas de belleza con sentido social orientadas a población vulnerable y con Ambientes de aprendizaje en prácticas reales aplicando normas bio-seguras para protección del usuario y aprendiz, otorgando tarjeta de certificación específica para egresados, con énfasis en las 2 técnicas internacionales y con talento humano calificado a la comunidad del Cauca y su zona de influencia.',
            style: CustomLabels.p3p,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}

class _PoliticaMovil extends StatelessWidget {
  const _PoliticaMovil({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Politica de Calidad',
          style: CustomLabels.h3,
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: size.width * 0.9,
          child: Text(
            'La Corporación Educativa Francia es una Institución de Educación para el trabajo y el desarrollo humano que forma técnicos laborales por competencia en estética ornamental por medio de brigadas de belleza con sentido social orientadas a población vulnerable y con Ambientes de aprendizaje en prácticas reales aplicando normas bio-seguras para protección del usuario y aprendiz, otorgando tarjeta de certificación específica para egresados, con énfasis en las 2 técnicas internacionales y con talento humano calificado a la comunidad del Cauca y su zona de influencia.',
            style: CustomLabels.p3p,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}

class _MisionVision extends StatelessWidget {
  const _MisionVision({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      width: size.width * 0.6,
      //color: Colors.red,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 300,
            width: size.width * 0.3,
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  'Misión',
                  style: CustomLabels.h3,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'La Corporación Educativa Francia es una Institución de Educación para el trabajo y el desarrollo humano que forma técnicos laborales por competencia en estética ornamental por medio de brigadas de belleza con sentido social orientadas a población vulnerable y con Ambientes de aprendizaje en prácticas reales aplicando normas bio-seguras para protección del usuario y aprendiz, otorgando tarjeta de certificación específica para egresados, con énfasis en las 2 técnicas internacionales y con talento humano calificado a la comunidad del Cauca y su zona de influencia.',
                  style: CustomLabels.p3p,
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 300,
            //color: Colors.blue,
            alignment: Alignment.topCenter,
            width: size.width * 0.3,
            child: Column(
              children: [
                Text(
                  'Visión',
                  style: CustomLabels.h3,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Para el año 2025 La Corporacion Educativa Francia tendrá una sede propia, tres planes de estudio certificados ante el ente pertinente y un convenio de articulación interinstitucional para el reconocimiento de nuestros egresados en el exterior',
                  style: CustomLabels.p3p,
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _MisionVisionMovil extends StatelessWidget {
  const _MisionVisionMovil({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      width: size.width * 0.9,
      //color: Colors.red,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: size.width * 0.9,
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  'Misión',
                  style: CustomLabels.h3,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'La Corporación Educativa Francia es una Institución de Educación para el trabajo y el desarrollo humano que forma técnicos laborales por competencia en estética ornamental por medio de brigadas de belleza con sentido social orientadas a población vulnerable y con Ambientes de aprendizaje en prácticas reales aplicando normas bio-seguras para protección del usuario y aprendiz, otorgando tarjeta de certificación específica para egresados, con énfasis en las 2 técnicas internacionales y con talento humano calificado a la comunidad del Cauca y su zona de influencia.',
                  style: CustomLabels.p3p,
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),

            //color: Colors.blue,
            alignment: Alignment.topCenter,
            width: size.width * 0.9,
            child: Column(
              children: [
                Text(
                  'Visión',
                  style: CustomLabels.h3,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Para el año 2025 La Corporacion Educativa Francia tendrá una sede propia, tres planes de estudio certificados ante el ente pertinente y un convenio de articulación interinstitucional para el reconocimiento de nuestros egresados en el exterior',
                  style: CustomLabels.p3p,
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _QuienesSomos extends StatelessWidget {
  const _QuienesSomos({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      width: size.width * 0.5,
      child: Text(
        'La Corporación Educativa Francia es una Institución de Educación para el trabajo y el desarrollo humano que forma técnicos laborales por competencia en estética ornamental por medio de brigadas de belleza con sentido social orientadas a población vulnerable y con Ambientes de aprendizaje en prácticas reales aplicando normas bio-seguras para protección del usuario y aprendiz, otorgando tarjeta de certificación específica para egresados, con énfasis en las 2 técnicas internacionales y con talento humano calificado a la comunidad del Cauca y su zona de influencia.',
        style: CustomLabels.p3p,
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class _QuienesSomosMovil extends StatelessWidget {
  const _QuienesSomosMovil({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      width: size.width * 0.9,
      child: Text(
        'La Corporación Educativa Francia es una Institución de Educación para el trabajo y el desarrollo humano que forma técnicos laborales por competencia en estética ornamental por medio de brigadas de belleza con sentido social orientadas a población vulnerable y con Ambientes de aprendizaje en prácticas reales aplicando normas bio-seguras para protección del usuario y aprendiz, otorgando tarjeta de certificación específica para egresados, con énfasis en las 2 técnicas internacionales y con talento humano calificado a la comunidad del Cauca y su zona de influencia.',
        style: CustomLabels.p3p,
        textAlign: TextAlign.justify,
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
        'Nosotros',
        style: (size.width < 865) ? CustomLabels.p3m : CustomLabels.p3,
        textAlign: TextAlign.center,
      ),
    );
  }
}
