import 'package:github_search/domain/model/projects_model.dart';

abstract class ProjectsServices {
  Future<List<ProjectsModel>> getRepositories(String user);
}
