import 'package:github_search/data/repositories/projects/projects_repository.dart';
import 'package:github_search/domain/model/projects_model.dart';

import './projects_services.dart';

class ProjectsServicesImpl implements ProjectsServices {
  final ProjectsRepository _projectsRepository;

  ProjectsServicesImpl({required ProjectsRepository projectsRepository})
      : _projectsRepository = projectsRepository;

  @override
  Future<List<ProjectsModel>> getRepositories(String user) => _projectsRepository.getRepositories(user);
}
