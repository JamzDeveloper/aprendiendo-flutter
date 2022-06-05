import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String type;
  const ScanTiles({required this.type});
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, i) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Color.fromARGB(255, 170, 93, 93),
              ),
              onDismissed: (DismissDirection direction) {
                Provider.of<ScanListProvider>(context, listen: false)
                    .deleteScanById(scans[i].id);
              },
              child: ListTile(
                leading: Icon(type == "geo" ? Icons.map : Icons.web,
                    color: const Color.fromARGB(255, 9, 219, 167)),
                title: Text(scans[i].valor),
                subtitle: Text(scans[i].id.toString()),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () => launchURL(context, scans[i]),
                
              ),
            ));
  }
}
