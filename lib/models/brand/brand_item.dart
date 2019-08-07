class BrandItem {
  int brandId;
  String brandName;
  bool isSelected = false;

  BrandItem({this.brandId, this.brandName});

  BrandItem.fromJson(Map<String, dynamic> json) {
    brandId = json['BRANDID'];
    brandName = json['BRANDNAME'];
  }
}