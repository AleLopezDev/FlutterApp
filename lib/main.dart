import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: const [
              SizedBox(height: 20), // Añade 'const' aquí
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              SizedBox(height: 20), // Añade 'const' aquí
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
