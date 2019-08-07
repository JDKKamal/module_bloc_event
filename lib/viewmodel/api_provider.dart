import 'dart:async';
import 'package:module_bloc_event/models/brand/brand.dart';
import 'package:module_bloc_event/models/login.dart';
import 'package:module_bloc_event/models/model/model.dart';
import 'package:module_bloc_event/service/abstract/api_service.dart';
import 'package:module_bloc_event/service/di/dependency_injection.dart';
import 'package:module_bloc_event/service/network_service_response.dart';

class ApiProvider {
  NetworkServiceResponse apiResult;
  APIService apiService = new Injector().flavor;

  Future<Null> getLogin(String phoneNumber, String password) async {
    NetworkServiceResponse<LoginResponse> result =
    await apiService.login(phoneNumber, password);
    this.apiResult = result;
  }

  Future<Null> getBrands() async {
    NetworkServiceResponse<BrandResponse> result =
    await apiService.brand();
    this.apiResult = result;
  }

  Future<Null> getModels(int brandId) async {
    NetworkServiceResponse<ModelResponse> result =
    await apiService.model(brandId);
    this.apiResult = result;
  }
}
