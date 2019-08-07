class ModelItem {
  int modelId;
  String modelName;
  bool isSelected = false;

  ModelItem({this.modelId, this.modelName});

  ModelItem.fromJson(Map<String, dynamic> json) {
    modelId = json['MODELID'];
    modelName = json['MODELNAME'];
  }
}