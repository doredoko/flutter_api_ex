import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    fetchJsonData();
  }

  Future<void> fetchJsonData() async {
    final response = await http.get(Uri.parse('http://192.168.0.201:8000/tasks'));

    if (response.statusCode == 200) {
      final List<dynamic> data =json.decode(utf8.decode(response.bodyBytes));
      setState(() {
        items = List<Map<String, dynamic>>.from(data);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON ListView'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(

            title: Text(items[index]['title']),// JSONデータのキーに合わせて変更
            subtitle: Text('${items[index]['id']}, ${items[index]['done']}'),

          );
        },
      ),
    );
  }
}

void main() {
  http.Client().get(Uri.parse('http://192.168.0.201:8000/tasks')).then((response) {
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  });
  runApp(MaterialApp(
    home: MyListView(),
  ));
}
