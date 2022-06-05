import 'package:flutter/foundation.dart';
import 'package:qr_reader/providers/db.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String typeSelection = "http";

  Future<ScanModel> newScan(String valor) async {
    ScanModel temScan;

    if (valor.contains("http")) {
      temScan = ScanModel(id: 0, tipo: "http", valor: valor);
    } else {
      temScan = ScanModel(id: 0, tipo: "geo", valor: valor);
    }
    final id = await DBProvider.db.newScan(temScan);
    temScan.id = id;
    if (typeSelection == temScan.tipo) {
      scans.add(temScan);
      notifyListeners();
    }
    return temScan;
  }

  loadScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  loadScanByType(String type) async {
    final scans = await DBProvider.db.getFromType(type);

    this.scans = [...scans];
    typeSelection = type;
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScan();
    scans = [];
    notifyListeners();
  }

  deleteScanById(int id) async {
    await DBProvider.db.deleteScan(id);
    loadScanByType(typeSelection);
  }
}
