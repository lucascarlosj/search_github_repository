import 'package:github_search/application/utils/messages.dart';
import 'package:github_search/domain/model/projects_model.dart';
import 'package:github_search/domain/services/projects/projects_services.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ProjectsServices _projectsServices;

  _HomeControllerBase({required ProjectsServices projectsServices})
      : _projectsServices = projectsServices;

  @observable
  var dados = ObservableList<ProjectsModel>();

  @action
  Future searchRepositories(String user) async {
    try {
      final result = await _projectsServices.getRepositories(user);
      dados.clear();
      dados.addAll(result);
    } catch (e) {
      Messages.alert('Usuario não encontrado!');
    }
  }

  @action
  void clearRepositories(){
    dados.clear();
  }
}
