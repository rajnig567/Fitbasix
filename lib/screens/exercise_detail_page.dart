import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitbasix/utils/extensions.dart';
import 'package:flutter/material.dart';

class ExerciseDetailPage extends StatefulWidget {
  const ExerciseDetailPage({Key? key}) : super(key: key);

  @override
  State<ExerciseDetailPage> createState() => _ExerciseDetailPageState();
}

class _ExerciseDetailPageState extends State<ExerciseDetailPage> {
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
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: 'https://api.exercisedb.io/image/pWmCmkhq8x57vV',
              height: context.height * 0.35,
            ),
            20.heightSizedBox,
            detailTile(title: 'Name', subTitle: 'subTitle'),
            detailTile(title: 'Target', subTitle: 'subTitle'),
            detailTile(title: 'Body Part', subTitle: 'subTitle'),
            detailTile(title: 'Equipment', subTitle: 'subTitle'),
            detailTile(title: 'title', subTitle: 'subTitle'),
          ],
        ),
      ),
    );
  }

  Widget detailTile({required String title, required String subTitle}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subTitle,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

}
