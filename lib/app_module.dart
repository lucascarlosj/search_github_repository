import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_search/application/pages/home/home_controller.dart';
import 'package:github_search/application/pages/home/home_page.dart';
import 'package:github_search/data/repositories/projects/projects_repository_impl.dart';
import 'package:github_search/domain/services/projects/projects_services_impl.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProjectsRepositoryImpl()),
    Bind.lazySingleton((i) => ProjectsServicesImpl(projectsRepository: i())),
    Bind.lazySingleton((i) => HomeController(projectsServices: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => HomePage(),
    ),
  ];
}
