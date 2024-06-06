import 'package:connectivity_plus/connectivity_plus.dart';


Future<bool> checkInternet() async {


  final connectivityResult = await (Connectivity().checkConnectivity());

  if (connectivityResult == ConnectivityResult.mobile) {
    // I am connected to a mobile network.
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    // I am connected to a wifi network.
    return true;
  } else if (connectivityResult == ConnectivityResult.ethernet) {
    // I am connected to a ethernet network.
    return true;
  } else if (connectivityResult == ConnectivityResult.vpn) {
    return true;
    // I am connected to a vpn network.
    // Note for iOS and macOS:
    // There is no separate network interface type for [vpn].
    // It returns [other] on any device (also simulator)
  } else if (connectivityResult == ConnectivityResult.bluetooth) {
    // I am connected to a bluetooth.
    return true;
  } else if (connectivityResult == ConnectivityResult.other) {
    // I am connected to a network which is not in the above mentioned networks.
    return true;
  } else if (connectivityResult == ConnectivityResult.none) {
    // I am not connected to any network.
    return false;
  } else {
    return false;
  }


}