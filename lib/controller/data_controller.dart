import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_test/model/data_model.dart';

final getDataFuture = ChangeNotifierProvider((ref) => GetDataFromApi());

class GetDataFromApi extends ChangeNotifier {
  List dataModelList = [];

  GetDataFromApi() {
    getData();
  }

  Future getData() async {
    try {
      http.Response response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      var data = jsonDecode(response.body);
      for (int i = 0; i < data.length; i++) {
        dataModelList.add(DataModel.fromMap(data[i]));
      }
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
