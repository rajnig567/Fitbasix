import 'package:fitbasix/domain/repository/i_exercise_repository.dart';
import 'package:get/get.dart';

import '../model/exercise_model_entity.dart';

class ExerciseController extends GetxController {
  RxList<ExerciseModelEntity> exerciseList = <ExerciseModelEntity>[].obs;
  late IExerciseRepository repository;

  ExerciseController() {
    repository = Get.find<IExerciseRepository>();
  }

  void getExerciseList() async {
    try {
      final List<ExerciseModelEntity> list = await repository.getExerciseList();
      exerciseList.value = list;
    } catch (e) {
      print(e);
    }
  }
}
