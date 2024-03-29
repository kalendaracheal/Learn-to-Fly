import 'package:flutter/material.dart';

import 'Activity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn To Fly',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Learn to Fly'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('/Images/bg.png'),
                fit: BoxFit.cover
            )
        ),

          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Padding(padding: const EdgeInsets.only(left: 80.0, right: 80.0, top: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text("Login",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)
                  ),
                  const SizedBox(height: 20),
                  const Text('Hello! Let us get you logged in',
                      style:  TextStyle( fontSize: 16)
                  ),
                  const SizedBox(height: 20),
                  const Text('Hello World'),
                  const SizedBox(height: 20),
                  Padding(padding: const EdgeInsets.all(20.0),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(),


                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),
                  TextFormField(

                    decoration: const InputDecoration(
                      hintText: 'Enter your password',
                      border: OutlineInputBorder()

                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text("Don't have an account, sign up here"),

                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Activity()),
                        );
                      },
                      child: const Text("Login")
                  ),
                ],
              ),
            ),
      
      ]),
      )
    );
  }
}
