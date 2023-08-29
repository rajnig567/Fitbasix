import 'package:fitbasix/generated/json/base/json_field.dart';
import 'package:fitbasix/generated/json/exercise_model_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ExerciseModelEntity {

	String? bodyPart;
	String? equipment;
	String? gifUrl;
	String? id;
	String? name;
	String? target;
  
  ExerciseModelEntity();

  factory ExerciseModelEntity.fromJson(Map<String, dynamic> json) => $ExerciseModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $ExerciseModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}