import 'brand_item.dart';

class BrandResponse {
  String code;
  String message;
  List<BrandItem> brands;

  BrandResponse({this.code, this.message, this.brands});

  BrandResponse.fromJson(Map<String, dynamic> json) {
    code = json['RESPONSECODE'];
    message = json['RESPONSEMESSAGE'];

    if (json['Brands'] != null) {
      brands = new List<BrandItem>();
      json['Brands'].forEach((v) {
        brands.add(new BrandItem.fromJson(v));
      });
    }
  }
}
