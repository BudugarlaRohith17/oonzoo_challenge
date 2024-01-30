import 'package:flutter/material.dart';
import 'package:oonzoo_task/additional%20page/provider.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    final universities = Provider.of<UniversityProvider>(context).universities;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'universities',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: universities.length,
        itemBuilder: (context, index) {
          final university = universities[index];
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Domain: ${university.domains?.first ?? '-'}'),
                  Text('AlphaCode: ${university.alphaTwoCode ?? '-'}'),
                  Text('State Province: ${university.stateProvince ?? '-'}'),
                  Text('Name: ${university.name ?? '-'}'),
                  Text('Website: ${university.webPages?.first ?? '-'}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
