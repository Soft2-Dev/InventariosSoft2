import 'package:flutter/material.dart';
import 'package:pido/ui/construcion_page.dart';
import 'package:pido/ui/layout/categorias/productosCategorias.dart';
import 'package:pido/ui/layout/homePages.dart';
import 'package:pido/ui/layout/productos/detalleProducto.dart';

Map<String, WidgetBuilder> getRutas() {
  return <String, WidgetBuilder>{
    'homes': (BuildContext context) => HomePage(),
    'DetalleProducto': (BuildContext context) => DetalleProducto(),
    'ProductosCategoria': (BuildContext context) => ProductosCategoria(),
  };
}

Map<String, WidgetBuilder> getNoRutas() {
  return <String, WidgetBuilder>{
    'construccion': (BuildContext context) => Construccion(),
  };
}
