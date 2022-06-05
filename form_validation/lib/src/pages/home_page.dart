import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/provider.dart';
import 'package:form_validation/src/model/product_model.dart';
import 'package:form_validation/src/provider/product_provider.dart';

class HomePage extends StatelessWidget {
  final producProvider = ProductProvider();


  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Welcome"),
      ),
      body: _createList(),
      floatingActionButton: _createButton(context),
    );
  }

  _createButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.deepPurple,
      child: const Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'product'),
    );
  }

  _createList() {
    return FutureBuilder(
        future: producProvider.loadProduct(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.hasData) {
     
            final products = snapshot.data;

            return ListView.builder(
              itemCount: products?.length,
              itemBuilder: (BuildContext context, int index) =>
                  _createItem(context, products![index]),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget _createItem(BuildContext context, ProductModel product) {
 
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        alignment: Alignment.topRight,
        color: Colors.red,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.delete,
                color: Colors.white,
              )
            ]),
      ),
      onDismissed: (direction) {
        producProvider.deleteProduct(product.id);
      },
      child: Card(
        child: Column(
          children: [
            (product.fotoUrl == '')
                ? Image(
                    image: AssetImage('assets/no-image.png'),
                  )
                : FadeInImage(
                    placeholder: AssetImage('assets/jar-loading.gif'),
                    image: NetworkImage(product.fotoUrl)),
            ListTile(
              title: Text('${product.titulo} - ${product.valor}'),
              subtitle: Text('${product.id}'),
              onTap: () =>
                  Navigator.pushNamed(context, 'product', arguments: product),
            ),
          ],
        ),
      ),
    );
  }
}
