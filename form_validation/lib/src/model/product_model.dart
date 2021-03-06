import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());
String productModelToJsonPersonal(ProductModel data) =>
    json.encode(data.toJsonPersonal());

class ProductModel {
  ProductModel({
    this.id = '',
    this.titulo = '',
    this.valor = 0.0,
    this.disponible = true,
    this.fotoUrl = '',
  });

  String id;
  String titulo;
  double valor;
  bool disponible;
  String fotoUrl;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        titulo: json["titulo"],
        valor: json["valor"].toDouble(),
        disponible: json["disponible"],
        fotoUrl: json["fotoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "valor": valor,
        "disponible": disponible,
        "fotoUrl": fotoUrl,
      };

  Map<String, dynamic> toJsonPersonal() => {
        "titulo": titulo,
        "valor": valor,
        "fotoUrl": fotoUrl,
        "disponible": disponible,
      };
}
