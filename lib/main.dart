import 'package:flutter/material.dart';

void main() {
  runApp(const Dashboard());
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  String message = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lab 3 Task 1'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Enter name'),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Enter age'),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                  onPressed: () => {
                        setMessage(
                            nameController.text, int.parse(ageController.text)),
                      },
                  child: const Text("Calculate")),
              const SizedBox(height: 8.0),
              Text(
                message,
                style: const TextStyle(
                    fontSize: 12.0, fontFamily: 'Times New Roman'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  setMessage(String name, int age) {
    if (age > 100) {
      setState(() {
        message = '$name are above 100 years old';
      });
    } else {
      setState(() {
        message = '$name has ${100 - age} years left for being 100 years old.';
      });
    }
  }
}
