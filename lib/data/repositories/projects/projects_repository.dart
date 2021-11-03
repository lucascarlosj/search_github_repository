import 'package:github_search/domain/model/projects_model.dart';

abstract class ProjectsRepository {

  Future<List<ProjectsModel>> getRepositories(String user);
}