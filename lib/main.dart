import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // invoking the constructor of MyApp (due to the parens)
}

class MyApp extends StatelessWidget { // StatelessWidget - the code that
  // creates a view object that doesn't need to be updated as the state changes
  const MyApp({Key? key}) : super(key: key); // no new keyword; also, this
  // immediately invokes the superclass constructor
  // the Key? means an object of type Key (nullable = ?) named key
  //the superclass params say that the key name refers to key (that we pass in)

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // passing in arguments by name - paramName: arg
      theme: ThemeData( // how to create the theme
        primarySwatch: Colors.deepPurple, //can leave a comma after the last
        // arg, don't need it though
      ),
      home: const MyHomePage(title: 'Craps Simulator'),// these params
      // can be in any order, because we refer to them by name (must incl. names)
      debugShowCheckedModeBanner: false, //gets rid of the debug banner
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  // required this.title means that a field of the class is created called title that is required in the constructor

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState(); //lambda or anonymous
  // method, since it's only one line (called expression lambda in java)
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _running = false;

  void _incrementCounter() {
    setState(() { // another anonymous method/lambda
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold( //this is a widget
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title), //the MyHomePage widget title
        actions: <Widget>[
          if (!_running) IconButton(
            icon: const Icon(
              Icons.replay,
              color: Colors.white,
            ),
            onPressed: () => {},
          ),
          IconButton(
            icon: _running
                ? const Icon(Icons.pause)
                : const Icon(Icons.play_arrow),
            onPressed: () => setState(() => _running = !_running),
          ),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ // this is a array of Widgets (generic, because
            // many different kinds) that become the children of the column
            const Text( //constant from compile-time
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter', //string interpolation- takes value of counter and makes it the text
              style: Theme.of(context).textTheme.headline4, //material design distinctions for headlines
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton( //another widget - this one is stateless
        onPressed: _incrementCounter, //basically a method reference lambda
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
