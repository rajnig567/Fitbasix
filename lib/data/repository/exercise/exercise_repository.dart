
import '../../../domain/repository/i_exercise_repository.dart';
import '../../../model/exercise_model_entity.dart';
import '../../../utils/helpers/api/result.dart';
import '../../datasource/i_app_datasource.dart';

class ExerciseRepository extends IExerciseRepository {
  ExerciseRepository({required this.source});

  final IAppDatasource source;

  @override
  Future<List<ExerciseModelEntity>> getExerciseList() async {
    final Result<List<ExerciseModelEntity>> result = await source.getExerciseList();

    return result.fold(
      (List<ExerciseModelEntity>? data) => data!,
      (Exception exception) => throw exception,
    );
  }

}
