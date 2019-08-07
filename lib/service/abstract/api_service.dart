import 'dart:async';
import 'package:module_bloc_event/models/brand/brand.dart';
import 'package:module_bloc_event/models/login.dart';
import 'package:module_bloc_event/models/model/model.dart';
import 'package:module_bloc_event/service/network_service_response.dart';

abstract class APIService {
  Future<NetworkServiceResponse<LoginResponse>> login(String phoneNumber, String password);
  Future<NetworkServiceResponse<BrandResponse>> brand();
  Future<NetworkServiceResponse<ModelResponse>> model(int brandId);
}
