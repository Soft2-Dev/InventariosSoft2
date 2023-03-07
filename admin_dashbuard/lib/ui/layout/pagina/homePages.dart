import 'package:admin_dashbuard/provider/authProvider.dart';
import 'package:admin_dashbuard/provider/homeProvider.dart';

import 'package:admin_dashbuard/router/router.dart';

import 'package:admin_dashbuard/services/localStorage.dart';
import 'package:admin_dashbuard/services/navigationService.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePagesLayouth extends StatefulWidget {
  final Widget child;

  const HomePagesLayouth({Key? key, required this.child}) : super(key: key);

  @override
  _HomePagesLayouthState createState() => _HomePagesLayouthState();
}

class _HomePagesLayouthState extends State<HomePagesLayouth> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Container(
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                  //color: Colors.red,
                  margin: EdgeInsets.only(top: 230),
                  child: widget.child),
              _header(),
              if (size.width > 600)
                Positioned(
                    bottom: 10, left: 10, child: Container(child: _WhatsApp())),
            ],
          )),
    ));
  }

  Container _header() {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff1f7dc1), Color(0xff33a4e1)]),
            ),
            padding: EdgeInsets.only(
              left: (size.width > 740) ? size.width * 0.15 : size.width * 0.10,
              right: (size.width > 740) ? size.width * 0.15 : size.width * 0.10,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.smartphone,
                  color: Colors.white,
                  size: 15,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Text(
                    '032 8373034 - 322 9004069',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                ),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    _launchURL(
                        'https://www.facebook.com/academiafrancia.bellezaydisenocauca.58/');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    width: 25,
                    height: 25,
                    child: Image(image: AssetImage('img/facebook.png')),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.35),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(color: Colors.black38, blurRadius: 2)
                        ]),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    _launchURL(
                        'https://instagram.com/academiafranciapopayan?utm_medium=copy_link');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    width: 25,
                    height: 25,
                    child: Image(image: AssetImage('img/instagram.png')),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(color: Colors.black38, blurRadius: 2)
                        ]),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    _launchURL('https://twitter.com/FranciaAcademia');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    width: 25,
                    height: 25,
                    child: Image(image: AssetImage('img/twitter.png')),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(color: Colors.black38, blurRadius: 2)
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black54, blurRadius: 5, offset: Offset(0, 0))
            ]),
            padding: EdgeInsets.only(
                left:
                    (size.width > 740) ? size.width * 0.15 : size.width * 0.05,
                right:
                    (size.width > 740) ? size.width * 0.15 : size.width * 0.05,
                top: 10),
            height: 190,
            child: (size.width > 1000)
                ? _DestockMenu(context: context)
                : _MovilMenu(context: context),
          ),
        ],
      ),
    );
  }

  _launchURL(String text) async {
    String url = text;

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class _MovilMenu extends StatefulWidget {
  const _MovilMenu({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  __MovilMenuState createState() => __MovilMenuState();
}

class __MovilMenuState extends State<_MovilMenu> {
  void _navigateTo(String rutename) {
    NavigationService.replaceTo(rutename);
  }

  @override
  Widget build(BuildContext context) {
    final press = Provider.of<HomeProvider>(context);
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          //color: Colors.green,
          width: (size.width > 600) ? 170 : 100,
          height: (size.width > 600) ? 120 : 120,
          child: Image(
            image: AssetImage('img/logonegro.png'),
            fit: BoxFit.contain,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    press.setInicio(true);
                    _navigateTo(Flurorouter.rootRoute);
                  });
                },
                child: Text(
                  'Inicio',
                  style: GoogleFonts.roboto(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff1f7dc1),
                    decoration: (press.inicio == true)
                        ? TextDecoration.underline
                        : TextDecoration.none,
                  ),
                )),
            SizedBox(
              width: 15,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    press.setProgramas(true);
                    _navigateTo(Flurorouter.programasRoute);
                  });
                },
                child: Text(
                  'Programas',
                  style: GoogleFonts.roboto(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff1f7dc1),
                    decoration: (press.programas == true)
                        ? TextDecoration.underline
                        : TextDecoration.none,
                  ),
                )),
            SizedBox(
              width: 15,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    press.setNosotros(true);
                    _navigateTo(Flurorouter.nosotrosRoute);
                  });
                },
                child: Text(
                  'Nosotros',
                  style: GoogleFonts.roboto(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff1f7dc1),
                    decoration: (press.nosotros == true)
                        ? TextDecoration.underline
                        : TextDecoration.none,
                  ),
                )),
            IconButton(
                icon: Icon(
                  Icons.person_outline_outlined,
                  color: Color(0xff1f7dc1),
                  size: 25,
                ),
                onPressed: () {
                  LocalStorage.prefs.setString('home', '2');

                  Provider.of<AuthProvider>(context, listen: false).loguin();
                }),
          ],
        ),
      ],
    );
  }
}

class _DestockMenu extends StatefulWidget {
  const _DestockMenu({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  __DestockMenuState createState() => __DestockMenuState();
}

class __DestockMenuState extends State<_DestockMenu> {
  void _navigateTo(String rutename) {
    NavigationService.replaceTo(rutename);
  }

  @override
  Widget build(BuildContext context) {
    final press = Provider.of<HomeProvider>(context);
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 70),
          //color: Colors.red,
          width: 300,
          height: 100,
          child: Image(
            image: AssetImage('img/logonegro.png'),
            fit: BoxFit.contain,
          ),
        ),
        Spacer(),
        TextButton(
            onPressed: () {
              setState(() {
                press.setInicio(true);
                _navigateTo(Flurorouter.rootRoute);
              });
            },
            child: Text(
              'Inicio',
              style: GoogleFonts.roboto(
                fontSize: (press.inicio == true) ? 21 : 19,
                fontWeight: FontWeight.w400,
                color: Color(0xff1f7dc1),
                decoration: (press.inicio == true)
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
            )),
        SizedBox(
          width: 15,
        ),
        TextButton(
            onPressed: () {
              setState(() {
                press.setProgramas(true);
                _navigateTo(Flurorouter.programasRoute);
              });
            },
            child: Text(
              'Programas',
              style: GoogleFonts.roboto(
                fontSize: (press.programas == true) ? 21 : 19,
                fontWeight: FontWeight.w400,
                color: Color(0xff1f7dc1),
                decoration: (press.programas == true)
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
            )),
        SizedBox(
          width: 15,
        ),
        TextButton(
            onPressed: () {
              setState(() {
                press.setNosotros(true);
                _navigateTo(Flurorouter.nosotrosRoute);
              });
            },
            child: Text(
              'Nosotros',
              style: GoogleFonts.roboto(
                fontSize: (press.nosotros == true) ? 21 : 19,
                fontWeight: FontWeight.w400,
                color: Color(0xff1f7dc1),
                decoration: (press.nosotros == true)
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
            )),
        SizedBox(
          width: 15,
        ),
        IconButton(
            icon: Icon(
              Icons.person_outline_outlined,
              color: Color(0xff1f7dc1),
              size: 25,
            ),
            onPressed: () {
              LocalStorage.prefs.setString('home', '2');

              Provider.of<AuthProvider>(context, listen: false).loguin();
            }),
      ],
    );
  }
}

class _WhatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchURL(
            'https://api.whatsapp.com/send?phone=3229004069&text=Me%20interesa%20saber%20mas%20sobre...');
      },
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            alignment: Alignment.center,
            child: Container(
              width: 30,
              height: 30,
              child: Image(
                fit: BoxFit.contain,
                image: AssetImage('img/whatsapp.png'),
              ),
            ),
            decoration: BoxDecoration(
                color: Color(0xff00bb2d),
                borderRadius: BorderRadius.circular(100)),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            child: Text(
              '¿Cómo Podemos Ayudarte?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
          )
        ],
      ),
    );
  }

  _launchURL(String text) async {
    String url = text;

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
