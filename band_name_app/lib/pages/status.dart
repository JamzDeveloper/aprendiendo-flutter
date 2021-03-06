import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:band_name_app/services/socket_service.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<
    SocketService>(context);

    return Scaffold(
      body: Center(
        child: Text('ServerStatus: ${socketService.serverStatus}'),
      ),
    );
  }
}
