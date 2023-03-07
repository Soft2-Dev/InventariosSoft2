import 'package:flutter/material.dart';
import 'package:pido/provider/categoriasProvider.dart';
import 'package:pido/provider/productos/productoProvider.dart';
import 'package:provider/provider.dart';

class ProductosPages extends StatefulWidget {
  const ProductosPages({Key key}) : super(key: key);

  @override
  _ProductosPagesState createState() => _ProductosPagesState();
}

class _ProductosPagesState extends State<ProductosPages> {
  @override
  void initState() {
    super.initState();
    // final id = Provider.of<ProviderCategorias>(context, listen: false);
    Provider.of<ProviderProductos>(context, listen: false).getProductos();
  }

  @override
  Widget build(BuildContext context) {
    final productos = Provider.of<ProviderProductos>(context).productos;
    final provider = Provider.of<ProviderProductos>(context, listen: false);
    final size = MediaQuery.of(context).size;

    List<Widget> itemMap = productos
        .map((e) => Container(
              margin: EdgeInsets.only(top: 5, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, offset: Offset(1, 1), blurRadius: 2)
                  ]),
              child: ListTile(
                onTap: () {
                  provider.productosSeleccion = e;
                  Navigator.pushNamed(context, 'DetalleProducto');
                },
                title: Text(e.producto),
                subtitle: Row(
                  children: [
                    Row(
                      children: [
                        Text('Plu: '),
                        Text(
                          e.plu,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Row(
                      children: [
                        Text('Prest: '),
                        Text(
                          e.presentacion,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Row(
                      children: [
                        Text('Cant: '),
                        Text(
                          e.cantidad,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
                leading: Image(
                  image: NetworkImage(e.url),
                ),
                trailing: Column(
                  children: [
                    Text(
                      'Valor',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      e.valorMayor,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ))
        .toList();

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.1),
          child: Container(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 25),
            width: size.width,
            height: size.height * 0.06,
            decoration: BoxDecoration(color: Colors.blue, boxShadow: [
              BoxShadow(color: Colors.black45, offset: Offset(0, 1))
            ]),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'Buscar Producto',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20),
                  ),
                ),
                Container(
                  width: size.width * 0.15,
                  child: Icon(
                    Icons.search_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 3),
          height: size.height * 0.97,
          child: ListView(
            children: [...itemMap],
          ),
        ),
      ),
    );
  }
}
