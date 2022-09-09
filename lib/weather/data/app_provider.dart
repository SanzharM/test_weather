import 'package:portfoliome/core/api/api.dart';

abstract class AppProvider {
  final _api = Api();

  Api get api => _api;
}
