class UserModel {
  final String id;
  final String nombre;
  final String descripcion;
  final String icon;
  UserModel({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.icon,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      nombre: json["nombre"],
      descripcion: json["descripcion"],
      icon: json["icon"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nombre": nombre,
      "descripcion": descripcion,
      "icon": icon,
    };
  }
}
