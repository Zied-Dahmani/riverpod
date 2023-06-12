import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/controller/data_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer(
      builder: (context, ref, child) {
        final vm = ref.watch(getDataFuture);
        return vm.dataModelList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
            itemCount: vm.dataModelList.length,
            itemBuilder: (context, index) {
              return ListTile(
                      title: Text(vm.dataModelList[index].title),
                      subtitle: Text(vm.dataModelList[index].body),
                    );
            });
      },
    ));
  }
}
