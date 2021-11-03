import 'package:dio/dio.dart';
import 'package:github_search/core/faults/exceptions/request_exception.dart';
import 'package:github_search/data/serializers/projects/project_model_serializer.dart';
import 'package:github_search/domain/model/projects_model.dart';
import './projects_repository.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  @override
  Future<List<ProjectsModel>> getRepositories(String user) async {
    var response = await Dio().get("https://api.github.com/users/$user/repos");

    try {
      if (response.statusCode == 200) {
        print(response.data);
      }
    } on DioError catch (e) {
      print(e);
      throw RequestException('Erro ao buscar dados!');
    }

    return response.data
            .map<ProjectsModel>((json) => ProjectModelSerializer.fromMap(json))
            .toList() ??
        [];
  }
}
