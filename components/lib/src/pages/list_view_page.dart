import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listNumber = [];
  int _endItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _addTen();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _addTen();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView Page'),
        ),
        body: Stack(
          children: <Widget>[_createList(), _createLoading()],
        ));
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: getPage1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listNumber.length,
        itemBuilder: (BuildContext context, index) {
          final image = _listNumber[index];
          return Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/jar-loading.gif'),
                    image: NetworkImage(
                        'https://picsum.photos/500/300/?iamge= $image'),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/cosplay.jpg',
                          fit: BoxFit.cover);
                    },
                  )));
        },
      ),
    );
  }

  Future<Null> getPage1() async {
    const duration = Duration(seconds: 2);
    Timer(duration, () {
      _listNumber.clear();
      _endItem++;
      _addTen();
    });
    return Future.delayed(duration);
  }

  void _addTen() {
    for (var i = 1; i < 10; i++) {
      _endItem++;
      _listNumber.add(_endItem);
    }

    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;

    setState(() {
      const duration = Duration(seconds: 2);
      Timer(duration, responseHTTP);
    });
  }

  void responseHTTP() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(microseconds: 250),
    );
    _addTen();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
          const SizedBox(height: 15.0),
        ],
      );
    }
    return Container();
  }
}
