import 'package:meta/meta.dart';
import 'package:module_bloc_event/models/brand/brand.dart';
import 'package:module_bloc_event/models/model/model.dart';

class BrandState {
  final bool loading;
  final bool loaded;
  final Map error;

  final String apiName, brandName, modelName;
  int brandId, modelId;
  final BrandResponse brandResponse;
  final ModelResponse modelResponse;

  BrandState({
    @required this.loading,
    @required this.loaded,
    @required this.error,
    @required this.apiName,
    this.brandName,
    this.brandId,
    this.modelName,
    this.modelId,
    this.brandResponse,
    this.modelResponse,
  });

  factory BrandState.initial() {
    return BrandState(
      loading: false,
      loaded: false,
      error: null,
      apiName: '',
      brandName: 'No select brand',
      brandId: 0,
      modelName: 'No select model',
      modelId: 0,
      brandResponse: BrandResponse(),
      modelResponse: ModelResponse(),
    );
  }

  BrandState copyWith({
    bool loading,
    bool loaded,
    Map error,
    String apiName, brandName, modelName,
    int brandId, modelId,

    BrandResponse brandResponse,
    ModelResponse modelResponse,
  }) {
    return BrandState(
      loading: loading ?? this.loading,
      loaded: loaded ?? this.loaded,
      error: error ?? this.error,
      apiName: apiName ?? this.apiName,
      brandName: brandName ?? this.brandName,
      brandId: brandId ?? this.brandId,
      modelName: modelName ?? this.modelName,
      modelId: modelId ?? this.modelId,
      brandResponse: brandResponse ?? this.brandResponse,
      modelResponse: modelResponse ?? this.modelResponse,
    );
  }
}
