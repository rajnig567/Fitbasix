import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitbasix/controller/exercise_controller.dart';
import 'package:fitbasix/screens/exercise_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/exercise_model_entity.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({Key? key}) : super(key: key);

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  final ExerciseController _controller =
      Get.put<ExerciseController>(ExerciseController());

  @override
  void initState() {
    _controller.getExerciseList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercise',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(
        () {
          if (!_controller.isLoading.value) {
            if (_controller.exerciseList.isEmpty) {
              return const Center(
                child: Text(
                  'No data found!!!',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              );
            } else {
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _controller.exerciseList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: Get.width / (Get.height / 1.8),
                ),
                itemBuilder: (_, index) {
                  ExerciseModelEntity model = _controller.exerciseList[index];
                  return exerciseTile(
                    image: model.gifUrl ?? '',
                    title: model.name ?? '',
                    type: model.target ?? '',
                    onTap: () {
                      _controller.exercise.value = ExerciseModelEntity();
                      Get.to(() => ExerciseDetailPage(
                            id: model.id ?? '',
                          ));
                    },
                  );
                },
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget exerciseTile({
    required String image,
    required String title,
    required String type,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(1, 1),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              child: CachedNetworkImage(
                imageUrl: image,
                height: Get.height * 0.13,
              ),
            ),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              type,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
