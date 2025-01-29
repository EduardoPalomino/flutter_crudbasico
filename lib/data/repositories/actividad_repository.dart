import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/actividad.dart';

class ActividadRepo {
  final List<ActividadModel> actividadesMock = [
    ActividadModel(
      id: '1',
      nombre: "Actividad 1",
      descripcion: "Descripcion 1",
      icon: "assets/images/actividad1.png",
    ),
    ActividadModel(
      id: '2',
      nombre: "Actividad 2",
      descripcion: "Descripcion 2",
      icon: "assets/images/actividad2.png",
    ),
    ActividadModel(
      id: '3',
      nombre: "Actividad 3",
      descripcion: "Descripcion 3",
      icon: "assets/images/actividad3.png",
    ),
  ];

  Future<ActividadModel> getActividad(String nombre) async {
    final result = await http.get(Uri.parse(
        "http://localhost:3009/Actividads"));

    if (result.statusCode != 200) {
      throw Exception();
    }

    //un json es un string por eso decodifica
    final response = json.decode(result.body);

    // Decodifica la respuesta como una lista de objetos, tipamos el response2 como un array con contenido dinamico
    final List<dynamic> response2 = json.decode(result.body);

    // Mapea la lista de JSON a objetos ActividadModel, osea convierte el contenido de la lista a objetos de tipo ActividadModel
    final List<ActividadModel> actividades = response2
        .map((actividadJson) => ActividadModel.fromJson(actividadJson))
        .toList();

    // Busca la actividad con el nombre dado
    final actividadEncontrada = actividades.firstWhere(
          (actividad) => actividad.nombre.toLowerCase() == nombre.toLowerCase(),
      orElse: () => throw Exception("Actividad no encontrada"),
    );

    print('ActividadEncontrada: ${actividadEncontrada}');


    print("REPOSITORIO");
    print(response);
    //return ActividadModel.fromJson(response);
    return actividadEncontrada;

  }


}
