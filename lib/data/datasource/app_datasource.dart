
import 'dart:convert';

import 'package:fitbasix/utils/constants.dart';

import '../../model/exercise_model_entity.dart';
import '../../utils/helpers/api/api_provider.dart';
import '../../utils/helpers/api/result.dart';
import 'i_app_datasource.dart';

class AppDatasource extends IAppDatasource {
  AppDatasource({required this.client});

  final APIProvider client;

  @override
  Future<Result<List<ExerciseModelEntity>>> getExerciseList() async {
    Result result = await client.getAPICall(url: APIConstants.exercises);
    return NetworkResult(
      data: List.from(jsonDecode(result.data)).map((e) => ExerciseModelEntity.fromJson(e)).toList(),
      exception: result.exception,
    );
  }

  @override
  Future<Result<ExerciseModelEntity>> getExerciseFromID({String? id}) async {
    Result result = await client.getAPICall(url: '${APIConstants.exercises}/exercise/$id');
    return NetworkResult(
      data: ExerciseModelEntity.fromJson(jsonDecode(result.data)),
      exception: result.exception,
    );
  }

}
