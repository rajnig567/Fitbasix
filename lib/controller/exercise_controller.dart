import 'package:fitbasix/domain/repository/i_exercise_repository.dart';
import 'package:get/get.dart';

import '../model/exercise_model_entity.dart';

class ExerciseController extends GetxController {
  RxList<ExerciseModelEntity> exerciseList = <ExerciseModelEntity>[].obs;
  Rx<ExerciseModelEntity> exercise = ExerciseModelEntity().obs;
  Rx<bool> isLoading = false.obs;

  late IExerciseRepository repository;

  ExerciseController() {
    repository = Get.find<IExerciseRepository>();
  }

  void getExerciseList() async {
    isLoading.value = true;
    try {
      final List<ExerciseModelEntity> list = await repository.getExerciseList();
      isLoading.value = false;
      exerciseList.value = list;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error',e.toString(),);
    }
  }

  void getExerciseFromID({String? id}) async {
    try {
      final ExerciseModelEntity model = await repository.getExerciseFromID(id: id);
      exercise.value = model;
    } catch (e) {
      Get.snackbar('Error',e.toString(),);
    }
  }
}
