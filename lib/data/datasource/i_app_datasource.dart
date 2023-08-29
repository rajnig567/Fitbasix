
import '../../model/exercise_model_entity.dart';
import '../../utils/helpers/api/result.dart';

abstract class IAppDatasource{
  Future<Result<List<ExerciseModelEntity>>> getExerciseList();
  Future<Result<ExerciseModelEntity>> getExerciseFromID({String? id});
}