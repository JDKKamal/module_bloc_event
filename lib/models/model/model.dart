import 'model_item.dart';

class ModelResponse {
  String code;
  String message;
  List<ModelItem> models;

  ModelResponse({this.code, this.message, this.models});

  ModelResponse.fromJson(Map<String, dynamic> json) {
    code = json['RESPONSECODE'];
    message = json['RESPONSEMESSAGE'];

    if (json['Models'] != null) {
      models = new List<ModelItem>();
      json['Models'].forEach((v) {
        models.add(new ModelItem.fromJson(v));
      });
    }
  }
}
