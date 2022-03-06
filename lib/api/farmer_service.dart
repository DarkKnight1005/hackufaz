import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hackufaz/api/base_service.dart';
import 'package:hackufaz/models/farmer.dart';
import 'package:hackufaz/models/farms.dart';

class FarmerService extends BaseService {
  FarmerService() : super('farms');

  Future<List<Farms>> fetchTable() async {
    try {

      var _dioResponse = await dio.get(
        serviceUrl,
      );
      return farmsFromJson(_dioResponse.data);
    } catch (e) {
      var _error = e as DioError;
      if (_error.type == DioErrorType.response) {
        debugPrint(_error.response!.data.toString());
      }
      return [];
    }
  }

  Future<int> addFarmer(Farmer farmer) async {
    try {

      var _dioResponse = await dio.post(
        serviceUrl + "",
        data: farmer.toJson()
      );

      return _dioResponse.data;
    } catch (e) {
      var _error = e as DioError;
      if (_error.type == DioErrorType.response) {
        debugPrint(_error.response!.data.toString());
      }
      return 0;
    }
  }

  Future<int> updateCoefficient(String authToken) async {
    try {

      var _dioResponse = await dio.get(
        serviceUrl + "",
      );
      return _dioResponse.data;
    } catch (e) {
      var _error = e as DioError;
      if (_error.type == DioErrorType.response) {
        debugPrint(_error.response!.data.toString());
      }
      return 0;
    }
  }
}
