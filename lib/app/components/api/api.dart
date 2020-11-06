import 'package:dio/dio.dart';

import 'hostname.dart';

class Api {
  Dio _dio;

  // String _urlBase = "http://" +
  //     Hostname().getHostname().urlBaseProducao +
  //     Hostname().getHostname().portBaseProducao.toString();
  String _urlBase = "http://" +
      Hostname().getHostname().urlBaseDev +
      Hostname().getHostname().portBaseDev.toString();

  Dio get instance => _dio;

  Api() {
    BaseOptions _options = new BaseOptions(
      baseUrl: _urlBase,
    );
    _dio = new Dio(_options);
  }
}
