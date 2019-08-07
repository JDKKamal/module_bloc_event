import 'problem_item.dart';

class ProblemResponse {
  String code;
  String message;
  List<ProblemItem> problems;

  ProblemResponse({this.code, this.message, this.problems});

  ProblemResponse.fromJson(Map<String, dynamic> json) {
    code = json['RESPONSECODE'];
    message = json['RESPONSEMESSAGE'];
  }
}
