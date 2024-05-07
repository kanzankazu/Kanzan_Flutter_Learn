import 'package:belajar_1/core/services/network/internet_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetInfoImpl implements InternetInfo {
  const InternetInfoImpl({
    required this.checker,
  });

  final InternetConnectionChecker checker;

  @override
  Future<bool> hasConnection() => checker.hasConnection;
}
