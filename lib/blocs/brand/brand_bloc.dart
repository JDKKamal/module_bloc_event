import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:module_bloc_event/models/brand/brand.dart';
import 'package:module_bloc_event/models/model/model.dart';
import 'package:module_bloc_event/viewmodel/api_provider.dart';

import 'brand_event.dart';
import 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final ApiProvider apiProvider = ApiProvider();
  int brandId, modelId;
  String brandName, modelName;

  void getBrand() {
    dispatch(GetBrand());
  }

  void getModel() {
    dispatch(GetModel());
  }

  void brandInput(brandNameInput, brandIdInput) {
    this.brandName = brandNameInput;
    this.brandId = brandIdInput;

    dispatch(GetBrandName());
  }

  void modelInput(modelNameInput, modelIdInput) {
    this.modelName = modelNameInput;
    this.modelId = modelIdInput;

    dispatch(GetModelName());
  }

  void getBrandName() {
    dispatch(GetBrandName());
  }

  @override
  BrandState get initialState => BrandState.initial();

  @override
  Stream<BrandState> mapEventToState(BrandEvent event) async* {
    if (event is GetBrand) {
      yield currentState.copyWith(loading: true, apiName: 'Brand');

      try {
        await apiProvider.getBrands();
        BrandResponse brandResponse;
        if (apiProvider.apiResult != null &&
            apiProvider.apiResult.responseCode == 200) {
          brandResponse = apiProvider.apiResult.response;
          if (brandResponse.code == '1') {
            yield currentState.copyWith(
              brandResponse: apiProvider.apiResult.response,
              loaded: true,
              loading: false,
            );
          } else {
            yield currentState.copyWith(
              error: {"error": brandResponse.message},
              loaded: false,
              loading: false,
            );
          }
        }
      } catch (e) {
        yield currentState.copyWith(
          error: {"error": "Error, Something bad happened."},
          loaded: false,
          loading: false,
        );
      }
    }

    if (event is GetBrandName) {
      yield currentState.copyWith(brandName: brandName, brandId: brandId);
    }

    if (event is GetModelName) {
      yield currentState.copyWith(modelName: modelName, modelId: modelId);
    }

    if (event is GetModel) {
      yield currentState.copyWith(loading: true, apiName: 'Model');
      try {
        await apiProvider.getModels(brandId);
        ModelResponse modelResponse;
        if (apiProvider.apiResult != null &&
            apiProvider.apiResult.responseCode == 200) {
          modelResponse = apiProvider.apiResult.response;
          if (modelResponse.code == '1') {
            yield currentState.copyWith(
              modelResponse: apiProvider.apiResult.response,
              loaded: true,
              loading: false,
            );
          } else {
            yield currentState.copyWith(
              error: {"error": modelResponse.message},
              loaded: false,
              loading: false,
            );
          }
        }
      } catch (e) {
        yield currentState.copyWith(
          error: {"error": "Error, Something bad happened."},
          loaded: false,
          loading: false,
        );
      }
    }
  }
}
