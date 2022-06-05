import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Onffline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;

  get serverStatus => _serverStatus;

  SocketService() {
    _initConfig();
  }

  void _initConfig() {
    print("init");
    IO.Socket socket = IO.io(
        "http://192.168.1.7:4000/",
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .build());
    socket.onConnect((_) {
      _serverStatus = ServerStatus.Online;
      notifyListeners();
    });
    socket.onDisconnect((_) {
      _serverStatus = ServerStatus.Onffline;
      notifyListeners();
    });
  
    socket.on("new-message", (data) => print(data));
    /* socket.on("connect", (_) => {print("connect")});
    socket.on("disconnect", (_) => print("disconneect"));*/
  }
}
