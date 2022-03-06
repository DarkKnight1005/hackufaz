import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:hackufaz/consts/core_urls.dart';

abstract class BaseService {
  final Dio dio = new Dio();
  late String serviceUrl;
  BaseService(String path) {
    serviceUrl = CoreUrls.mainVISUrl + '/api/v1/$path/';
    //  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //       (HttpClient client) {
    //     client.badCertificateCallback =
    //         (X509Certificate cert, String host, int port) => true;
    //     return client;
    //   };
  }
}
