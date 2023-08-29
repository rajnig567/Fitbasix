
import '../../model/exercise_model_entity.dart';

abstract class IExerciseRepository{
  Future<List<ExerciseModelEntity>> getExerciseList();
}