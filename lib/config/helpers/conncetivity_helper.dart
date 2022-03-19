import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> hasNetworkConnection() async {
  final res = await Connectivity().checkConnectivity();
  if (res == ConnectivityResult.none || res == ConnectivityResult.bluetooth) {
    return false;
  } else {
    return true;
  }
}
