import 'package:bingo_project/core/services/config.dart';
import 'package:bingo_project/core/services/dio_api.dart';
import 'package:bingo_project/model/steps_model.dart';
import 'package:bingo_project/model/theory_model.dart';

class ApiProvider {
  final api = Api();
  Map<String, String> header = {'Content-Type': 'application/json'};

//!- - - - - get steps- - - - - !//
  Future<StepsModel> getSteps() async {
    var response = await api.sendRequest.get("${basUrl}fetchQuestions");
    return StepsModel.fromJson(response.data);
  }
}