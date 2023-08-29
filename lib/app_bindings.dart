import 'package:fitbasix/domain/repository/i_exercise_repository.dart';
import 'package:get/get.dart';

import 'data/datasource/app_datasource.dart';
import 'data/datasource/i_app_datasource.dart';
import 'data/repository/exercise/exercise_repository.dart';
import 'utils/helpers/api/api_provider.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<APIProvider>(
      () => APIProvider(),
    );
    initDataSources();
    initRepositories();
  }
}

void initDataSources() {
  Get.lazyPut<IAppDatasource>(
    () => AppDatasource(
      client: Get.find<APIProvider>(),
    ),
  );
}

void initRepositories() async {
  Get.lazyPut<IExerciseRepository>(
    () => ExerciseRepository(
      source: Get.find<IAppDatasource>(),
    ),
  );
}
