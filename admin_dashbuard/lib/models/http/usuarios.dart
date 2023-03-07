class Usuarios {
  List<Usuario> dato = [];
  Usuarios();

  Usuarios.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new Usuario.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class Usuario {
  String? id;
  String? nombre;
  String? correo;
  String? telefono;
  String? direccion;
  String? rol;
  String? img;
  String? estado;
  String? password;
  String? token;

  Usuario({
    this.id,
    this.nombre,
    this.correo,
    this.telefono,
    this.direccion,
    this.rol,
    this.img,
    this.estado,
    this.password,
    this.token,
  });

  Usuario.fromJsonMap(Map<String, dynamic> datos) {
    id = datos['id'];
    nombre = datos['nombre'];
    correo = datos['correo'];
    telefono = datos['telefono'];
    direccion = datos['direccion'];
    rol = datos['rol'];
    img = datos['img'];
    estado = datos['estado'];
    password = datos['password'];
    token = datos['token'];
  }
}
