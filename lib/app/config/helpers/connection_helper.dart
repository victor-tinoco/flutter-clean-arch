import 'package:data_connection_checker/data_connection_checker.dart';

abstract class ConnectionHelper {
  Future<bool> hasNatworkConnection();
  Stream<bool> onNetworkChanges();
}

class ConnectionHelperImpl implements ConnectionHelper {
  final _connectionChecker = DataConnectionChecker()
    ..checkInterval = Duration(milliseconds: 50);

  Future<bool> hasNatworkConnection() async {
    return _connectionChecker.hasConnection;
  }

  Stream<bool> onNetworkChanges() => _connectionChecker.onStatusChange
      .map((event) => event == DataConnectionStatus.connected);
}
