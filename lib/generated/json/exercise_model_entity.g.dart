import 'package:fitbasix/generated/json/base/json_convert_content.dart';
import 'package:fitbasix/model/exercise_model_entity.dart';

ExerciseModelEntity $ExerciseModelEntityFromJson(Map<String, dynamic> json) {
	final ExerciseModelEntity exerciseModelEntity = ExerciseModelEntity();
	final String? bodyPart = jsonConvert.convert<String>(json['bodyPart']);
	if (bodyPart != null) {
		exerciseModelEntity.bodyPart = bodyPart;
	}
	final String? equipment = jsonConvert.convert<String>(json['equipment']);
	if (equipment != null) {
		exerciseModelEntity.equipment = equipment;
	}
	final String? gifUrl = jsonConvert.convert<String>(json['gifUrl']);
	if (gifUrl != null) {
		exerciseModelEntity.gifUrl = gifUrl;
	}
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		exerciseModelEntity.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		exerciseModelEntity.name = name;
	}
	final String? target = jsonConvert.convert<String>(json['target']);
	if (target != null) {
		exerciseModelEntity.target = target;
	}
	return exerciseModelEntity;
}

Map<String, dynamic> $ExerciseModelEntityToJson(ExerciseModelEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['bodyPart'] = entity.bodyPart;
	data['equipment'] = entity.equipment;
	data['gifUrl'] = entity.gifUrl;
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['target'] = entity.target;
	return data;
}