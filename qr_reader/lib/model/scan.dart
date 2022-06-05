import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  ScanModel({
    required this.id,
    required this.tipo,
    required this.valor,
  }) {}

  int id;
  String tipo;
  String valor;

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );
  LatLng getLatLng() {
    final latLng = valor.substring(4).split(",");
    final lat = double.parse(latLng[0]);
    final lng = double.parse(latLng[1]);

    return LatLng(lat, lng);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };
  Map<String, String> toJsonInsertDB() => {
        "tipo": tipo,
        "valor": valor,
      };
  @override
  String toString() {
    return 'Scan{id: $id, tipo: $tipo, valor: $valor}';
  }
}
