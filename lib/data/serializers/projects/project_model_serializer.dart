import 'dart:convert';
import 'package:github_search/domain/model/projects_model.dart';

class ProjectModelSerializer {

  ProjectsModel projectsModel;

  ProjectModelSerializer.of(this.projectsModel);

  Map<String, dynamic> toMap() => {
      'id': projectsModel.id,
      'name': projectsModel.name,
      'full_name': projectsModel.fullName,
      'avatar_url': projectsModel.avatarUrl,
  };

  static ProjectsModel fromMap(Map<String, dynamic> map) => ProjectsModel(
      id: map['id'],
      name: map['name'],
      fullName: map['full_name'],
      avatarUrl: map['owner']["avatar_url"]
  );

  String toJson() => json.encode(toMap());

  static ProjectsModel fromJson(String source) => ProjectModelSerializer.fromMap(json.decode(source));
}
