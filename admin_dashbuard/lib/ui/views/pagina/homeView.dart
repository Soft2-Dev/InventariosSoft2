import 'package:admin_dashbuard/models/http/carrerasModels.dart';
import 'package:admin_dashbuard/models/http/noticiasModels.dart';
import 'package:admin_dashbuard/provider/carrerasProvider.dart';
import 'package:admin_dashbuard/provider/noticisasProvider.dart';
import 'package:admin_dashbuard/router/router.dart';
import 'package:admin_dashbuard/services/navigationService.dart';

import 'package:admin_dashbuard/ui/labels/customLabels.dart';
import 'package:admin_dashbuard/ui/shared/widgets/pagina/fotter.dart';
import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Provider.of<CarrerasProvider>(context, listen: false).getCarrera('1');
    Provider.of<NoticiasProvider>(context, listen: false).getTodasNoticias('1');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final carreras = Provider.of<CarrerasProvider>(context).carreras;
    final noticias = Provider.of<NoticiasProvider>(context).noticias;
    return Container(
      child: ListView(
        children: [
          _Titulo(size: size),
          _Baner(),
          SizedBox(
            height: 40,
          ),
          _Programas(size: size, carreras: carreras),
          SizedBox(
            height: 70,
          ),
          Container(
            //color: Colors.amber,
            alignment: Alignment.center,
            child: Text(
              'Noticias',
              style: CustomLabels.h4,
            ),
          ),
          _Noticias(size: size, noticias: noticias),
          SizedBox(
            height: 50,
          ),
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
        'ACADEMIA FRANCIA BELLEZA Y DISEÑO CAUCA',
        style: (size.width < 865) ? CustomLabels.p3m : CustomLabels.p3,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _Noticias extends StatelessWidget {
  _Noticias({
    Key? key,
    required this.size,
    required this.noticias,
  }) : super(key: key);

  final Size size;
  final List<Noticia> noticias;
  bool horienta = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print('noticias ' + noticias.length.toString());
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: List.generate(noticias.length, (index) {
          horienta = !horienta;
          return (!horienta)
              ? Container(
                  padding: EdgeInsets.symmetric(
                    vertical: (size.width < 600) ? 20 : 30,
                  ),
                  color: Color(0xfff2f1f6),
                  margin: EdgeInsets.only(bottom: 50),
                  width: size.width * 1,
                  // color: Colors.red,
                  child: (size.width > 900)
                      ? _noticiaDestockIsquierda(size, index)
                      : _noticiaMovileIsquierda(size, index),
                )
              : Container(
                  margin: EdgeInsets.only(bottom: 100),
                  width: size.width * 0.8,
                  //color: Colors.red,
                  child: (size.width > 900)
                      ? _noticiaMovileDerecha(size, index)
                      : _noticiaMovileIsquierda(size, index),
                );
        }),
      ),
    );
  }

  Row _noticiaMovileDerecha(Size size, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size.width * 0.35,
          height: 500,
          //color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    noticias[index].titulo!,
                    style: CustomLabels.p1,
                    textAlign: TextAlign.center,
                  )),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    noticias[index].descripcion!,
                    style: CustomLabels.p2,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              if (noticias[index].urlnota != null)
                Container(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () => _launchURL(url: noticias[index].urlnota!),
                    child: Text(
                      'Leer Mas...',
                      style: CustomLabels.link,
                      textAlign: TextAlign.left,
                    ),
                  ),
                )
            ],
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Container(
          //color: Colors.blue,
          width: size.width * 0.4,
          height: 500,
          child: Image.network(
            noticias[index].urlImagen!,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }

  Row _noticiaDestockIsquierda(Size size, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          //color: Colors.blue,
          width: size.width * 0.4,
          height: 500,
          child: Image.network(
            noticias[index].urlImagen!,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Container(
          width: size.width * 0.35,
          height: 500,
          //color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    noticias[index].titulo!,
                    style: CustomLabels.p1,
                    textAlign: TextAlign.center,
                  )),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    noticias[index].descripcion!,
                    style: CustomLabels.p2,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              if (noticias[index].urlnota != null)
                Container(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () => _launchURL(url: noticias[index].urlnota!),
                    child: Text(
                      'Leer Mas...',
                      style: CustomLabels.link,
                      textAlign: TextAlign.left,
                    ),
                  ),
                )
            ],
          ),
        )
      ],
    );
  }

  Column _noticiaMovileIsquierda(Size size, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          //color: Colors.blue,
          width: size.width * 0.8,
          height: 500,
          child: Image.network(
            noticias[index].urlImagen!,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: size.width * 0.8,
          height: 500,
          //color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    noticias[index].titulo!,
                    style: CustomLabels.p1,
                    textAlign: TextAlign.center,
                  )),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    noticias[index].descripcion!,
                    style: CustomLabels.p2,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              if (noticias[index].urlnota != null)
                Container(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () => _launchURL(url: noticias[index].urlnota!),
                    child: Text(
                      'Leer Mas...',
                      style: CustomLabels.link,
                      textAlign: TextAlign.left,
                    ),
                  ),
                )
            ],
          ),
        )
      ],
    );
  }

  _launchURL({required String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class _Programas extends StatelessWidget {
  const _Programas({
    Key? key,
    required this.size,
    required this.carreras,
  }) : super(key: key);

  final Size size;
  final List<Carrera> carreras;

  void _navigateTo(String rutename) {
    NavigationService.replaceTo(rutename);
  }

  @override
  Widget build(BuildContext context) {
    int miSecons = 200;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 30, bottom: 20),
          color: Color(0xfff2f1f6),
          alignment: Alignment.center,
          child: Text(
            'Nuestros Programas',
            style: CustomLabels.h4,
          ),
        ),
        Container(
          color: Color(0xfff2f1f6),
          alignment: Alignment.center,
          padding: EdgeInsets.only(
              left: size.width * 0.10, right: size.width * 0.10, bottom: 50),
          child: Wrap(
              spacing: 20,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              children: List.generate(carreras.length, (index) {
                return FadeInRight(
                  duration: Duration(milliseconds: miSecons += 200),
                  child: GestureDetector(
                    onTap: () {
                      _navigateTo(Flurorouter.programasRoute);
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(color: Colors.black54, blurRadius: 5)
                          ]),
                          margin: EdgeInsets.only(top: 10),
                          width: 350,
                          child: Center(
                            child: Stack(
                              children: [
                                Container(
                                  width: 350,
                                  height: 300,
                                  child: Image.network(
                                    carreras[index].img!,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    alignment: Alignment.center,
                                    width: 350,
                                    height: 300,
                                    color: Colors.black54,
                                    child: Text(
                                      carreras[index].carrera!,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 23),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                );
              })),
        ),
      ],
    );
  }
}

class _Baner extends StatelessWidget {
  final List<String> img = ['baner1.jpeg', 'baner2.jpeg', 'baner3.jpeg'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      //color: Colors.amber,
      width: double.infinity,
      height: (size.width < 600) ? 300 : 500,
      child: Swiper(
          control: SwiperControl(),
          pagination: new SwiperPagination(alignment: Alignment.bottomCenter),
          autoplay: true,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Image(
              image: AssetImage('img/' + img[index]),
              fit: BoxFit.fitWidth,
            );
          }),
    );
  }
}
