import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pido/api/AllApi.dart';
import 'package:pido/models/productosModelo.dart';
import 'package:pido/provider/categoriasProvider.dart';

class ProviderProductos extends ChangeNotifier {
  List<Producto> productos = [];
  Producto productosSeleccion;
  String isSelectProducto = '0';
  bool isProducto = false;

  getProductos() async {
    print('/webService.php?case=2');
    final resp = await AllApi.httpGet('/webService.php?case=2');
    print(resp);
    final dataMap = jsonDecode(resp);
    final Productos categorias = new Productos.fromlist(dataMap['rpta']);
    this.productos = categorias.dato;
    if (categorias.dato[0].rp == 'ok') {
      isProducto = true;
    }
    notifyListeners();
  }
}
