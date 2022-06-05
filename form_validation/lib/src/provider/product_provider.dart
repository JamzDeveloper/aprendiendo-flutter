import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'package:form_validation/src/model/product_model.dart';

class ProductProvider {
  final String _url = "https://flutter-dev-e2758-default-rtdb.firebaseio.com";

  Future<bool> creteProduct(ProductModel product) async {
    try {
      Uri url = Uri.parse('$_url/product.json');
      final resp =
          await http.post(url, body: productModelToJsonPersonal(product));

      final decodedData = json.decode(resp.body);

      print(decodedData);
      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }

  Future<bool> editProduct(ProductModel product) async {
    try {
      Uri url = Uri.parse('$_url/product/${product.id}.json');
      final resp =
          await http.put(url, body: productModelToJsonPersonal(product));

      final decodedData = json.decode(resp.body);

      print(decodedData);
      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }

  Future<List<ProductModel>> loadProduct() async {
    Uri url = Uri.parse('$_url/product.json');
    final resp = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(resp.body);

    final List<ProductModel> products = [];

    if (decodeData == null) return [];
    decodeData.forEach((id, dynamic prod) {
      final data = ProductModel(
          id: id,
          titulo: prod["titulo"],
          disponible: prod["disponible"],
          valor: double.parse(prod["valor"].toString()),
          fotoUrl: prod['fotoUrl'].toString());

      final prodTemp = ProductModel.fromJson(data.toJson());
      products.add(prodTemp);
    });

    return products;
  }

  Future<int> deleteProduct(String id) async {
    Uri url = Uri.parse('$_url/product/$id.json');
    final response = await http.delete(url);
    print(response.body);

    return 1;
  }

  Future<String> uploadImage(File image) async {
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/duhbmesjr/image/upload?upload_preset=ac7hjs9a');
    final mimeType = mime(image.path)!.split('/'); //image/jpg

    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file = await http.MultipartFile.fromPath(
      'file',
      image.path,
      contentType: MediaType(mimeType[0], mimeType[1]),
    );
    imageUploadRequest.files.add(file);

    final streamResponce = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponce);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('algo salio mal');
      print(resp.body);
      return '';
    }
    final respData = json.decode(resp.body);
    print(respData);
    return respData['secure_url'];
  }
}
