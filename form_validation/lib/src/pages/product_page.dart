import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_validation/src/model/product_model.dart';
import 'package:form_validation/src/provider/product_provider.dart';
import 'package:form_validation/src/utils/utils.dart' as utils;
import 'package:image_picker/image_picker.dart';

class ProductPage extends StatefulWidget {
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  ProductModel product = ProductModel();
  final productProvider = ProductProvider();
  File? photo = null;

  bool _saved = false;
  @override
  Widget build(BuildContext context) {
    final prodData = ModalRoute.of(context)?.settings.arguments;
    if (prodData != null) {
      product = prodData as ProductModel;
    }
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Product"),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
              icon: const Icon(Icons.photo_size_select_actual),
              onPressed: _selectedGalery),
          IconButton(onPressed: _showCamera, icon: Icon(Icons.camera_alt))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _showImage(),
                _createName(),
                _createPrice(),
                _createAvailable(),
                _createButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _createName() {
    return TextFormField(
        initialValue: product.titulo,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(labelText: "Product"),
        onSaved: (value) => product.titulo = value!,
        validator: (value) {
          if (value!.length < 3) {
            return "ingrese el nombre del producto";
          }
          return null;
        });
  }

  _createPrice() {
    return TextFormField(
        initialValue: product.valor.toString(),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(labelText: "Price"),
        onSaved: (value) => product.valor = double.parse(value!),
        validator: (value) {
          if (utils.isNumeric(value!)) {
            return null;
          } else {
            return "Solo se aceptan numeros";
          }
        });
  }

  _createButton() {
    return ElevatedButton.icon(
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
          return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20));
        }),
        backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
      ),
      label: Text("Save"),
      icon: Icon(Icons.save),
      onPressed: (_saved) ? null : _submit,
    );
  }

  void _submit() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    setState(() {
      _saved = true;
    });

    if (photo != null) {
      product.fotoUrl = await productProvider.uploadImage(photo!);
    }

    if (product.id == '' || product.id == null) {
      productProvider.creteProduct(product);
    } else {
      productProvider.editProduct(product);
    }
    setState(() {
      _saved = false;
    });
    showSnackBar('save registrer');
    Navigator.pop(context);
  }

  void showSnackBar(String message) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 1500),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  _createAvailable() {
    return SwitchListTile(
        value: product.disponible,
        title: Text('Available'),
        activeColor: Colors.deepPurple,
        onChanged: (value) => setState(() {
              product.disponible = value;
            }));
  }

  _showImage() {
    if (product.fotoUrl != "") {
      return FadeInImage(
        placeholder: AssetImage('assets/jar-loading.gif'),
        image: NetworkImage(product.fotoUrl),
        width: 300,
        height: 400,
        fit: BoxFit.cover,
      );
    } else {
      print('productUrl' + product.fotoUrl);

      if (photo != null) {
        return Image.file(
          photo!,
          width: 300,
          height: 400,
          fit: BoxFit.cover,
        );
      } else {
        return const Image(
          image: AssetImage('assets/no-image.png'),
          height: 300.0,
          fit: BoxFit.cover,
        );
      }
    }
  }

  _selectedGalery() async {
    _processImage(ImageSource.gallery);
  }

  _showCamera() async {
    _processImage(ImageSource.camera);
  }

  _processImage(ImageSource origin) async {
    final result = await ImagePicker().pickImage(source: origin);

    if (result != null) {
      product.fotoUrl = '';
      photo = File(result.path);
      print(photo);
    }
    setState(() {});

    return result;
  }
}
