import 'dart:convert';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oonzoo_task/apiclient/response_modal%20class.dart';

import 'additional page/provider.dart';
import 'additional page/second_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UniversityProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.white, // Set text color for AppBar title
          ),
          bodyMedium: TextStyle(
            color: Colors.black, // Set text color for other parts of the app
          ),
        ),
      ),
      home: const MyHomePage(title: 'University Information'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;

  Future<void> fetchData(BuildContext context) async {
    try {
      setState(() {
        isLoading = true;
      });
      final response = await http.get(Uri.parse(
          'http://universities.hipolabs.com/search?country=United+states'));

      final List<dynamic> universitiesData = json.decode(response.body);

      final List<UniversityResponse> universitiesList = universitiesData
          .map((data) => UniversityResponse.fromJson(data))
          .toList();

      Provider.of<UniversityProvider>(context, listen: false)
          .setUniversities(universitiesList);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondPage(),
        ),
      );
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  fetchData(context);
                },
                child: const Text(
                  'University Data',
                  style: TextStyle(color: Colors.black),
                )),
            if (isLoading) const SizedBox(height: 10),
            if (isLoading) const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
