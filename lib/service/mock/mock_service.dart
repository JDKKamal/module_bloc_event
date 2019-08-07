import 'dart:async';

import 'package:module_bloc_event/helpers/vars.dart';
import 'package:module_bloc_event/models/brand/brand.dart';
import 'package:module_bloc_event/models/login.dart';
import 'package:module_bloc_event/models/model/model.dart';
import 'package:module_bloc_event/service/abstract/api_service.dart';
import 'package:module_bloc_event/service/network_service_response.dart';

class MockService implements APIService {
  @override
  Future<NetworkServiceResponse<LoginResponse>> login(
      String phoneNumber, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return Future.value(NetworkServiceResponse(
        responseCode: ok200,
        response: LoginResponse(

        )));
  }

  @override
  Future<NetworkServiceResponse<BrandResponse>> brand() {
    return null;
  }

  @override
  Future<NetworkServiceResponse<ModelResponse>> model(int brandId) {
    return null;
  }
}
