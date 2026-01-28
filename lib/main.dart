import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 1',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 14, 59, 156)),
      ),
      home: const MyHomePage(title: 'Lab 1'),
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
  final stopwatch = Stopwatch();

  void startTimer() {
    setState(() {
      stopwatch.start();
    });
  }

  void resetTimer(){
    setState(() {
      stopwatch.reset();
    });
  }


  @override
  Widget build(BuildContext context) {
    int elapsedTime = (stopwatch.elapsedMilliseconds / 1000).toInt();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('Timer:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Text('$elapsedTime')
            ],)
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 15,
        children: [
          FloatingActionButton(
            onPressed: () => setState(() {
              startTimer();
            }),
            tooltip: 'Start Timer',
            child: const Icon(Icons.play_arrow_rounded),
          ),
          FloatingActionButton(
            onPressed: () => setState(() {
              resetTimer();
            }),
            tooltip: 'Reset Timer',
            child: const Icon(Icons.stop_rounded)
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
