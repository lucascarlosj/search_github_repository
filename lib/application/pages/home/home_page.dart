import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_search/application/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final userEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/25/25231.png',
              height: 20,
            ),
            const SizedBox(width: 10),
            const Text('Github User Repositories')
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.clearRepositories();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: userEC,
              decoration: InputDecoration(
                labelText: 'Usuário',
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.searchRepositories(userEC.text);
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            child: Observer(
              builder: (context) => ListView.builder(
                itemCount: controller.dados.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'Id: ${controller.dados[index].id.toString()}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    subtitle: Text(
                      controller.dados[index].name,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
