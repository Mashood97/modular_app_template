import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  const NetworkInfoImpl({required this.networkConnectionCheck});

  final Connectivity networkConnectionCheck;

  @override
  Future<bool> get isConnected async {
    final result = await networkConnectionCheck.checkConnectivity();
    return !result.contains(ConnectivityResult.none);
  }
}
