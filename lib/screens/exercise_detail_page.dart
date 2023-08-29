import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitbasix/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/exercise_controller.dart';

class ExerciseDetailPage extends StatefulWidget {
  const ExerciseDetailPage({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<ExerciseDetailPage> createState() => _ExerciseDetailPageState();
}

class _ExerciseDetailPageState extends State<ExerciseDetailPage> {
  final ExerciseController _controller =
      Get.put<ExerciseController>(ExerciseController());

  @override
  void initState() {
    _controller.getExerciseFromID(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercise Detail',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(() {
        if (_controller.exercise.value.id != null) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: _controller.exercise.value.gifUrl ?? '',
                  height: Get.height * 0.35,
                ),
                20.heightSizedBox,
                detailTile(
                    title: 'Name',
                    subTitle: _controller.exercise.value.name ?? ''),
                detailTile(
                    title: 'Target',
                    subTitle: _controller.exercise.value.target ?? ''),
                detailTile(
                    title: 'Body Part',
                    subTitle: _controller.exercise.value.bodyPart ?? ''),
                detailTile(
                    title: 'Equipment',
                    subTitle: _controller.exercise.value.equipment ?? ''),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }

  Widget detailTile({required String title, required String subTitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          20.widthSizedBox,
          Expanded(
            child: Text(
              subTitle,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
