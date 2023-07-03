import 'package:flutter/foundation.dart';

class OngkirData with ChangeNotifier {
  String? _kotaAsal;
  String? _kotaTujuan;
  String? _berat;
  String? _kurir;

  String? get kotaAsal => _kotaAsal;
  String? get kotaTujuan => _kotaTujuan;
  String? get berat => _berat;
  String? get kurir => _kurir;

  void setKotaAsal(String value) {
    _kotaAsal = value;
    notifyListeners();
  }

  void setKotaTujuan(String value) {
    _kotaTujuan = value;
    notifyListeners();
  }

  void setBerat(String value) {
    _berat = value;
    notifyListeners();
  }

  void setKurir(String value) {
    _kurir = value;
    notifyListeners();
  }

  bool isDataEmpty() {
    return _kotaAsal == null || _kotaTujuan == null || _berat == null || _kurir == null;
  }
}
