import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Node',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Node - Alpha version'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Elemento {
  Text text;
  Icon icon;

  Elemento({required this.text, this.icon = const Icon(Icons.offline_bolt)});

  void setOnline() {
    icon = const Icon(Icons.offline_bolt, color: Colors.green,);
  }

  ListTile render() {
    return ListTile(
              leading: icon,
              title: text,
            );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Elemento> _listItems = [];
  String _inputText = '';
  

  void _addItem() {
          Elemento _elemento = Elemento(text: Text(_inputText));
          setState(() {
              _listItems.add(_elemento);
          });
          Future.delayed(const Duration(seconds: 3), () {
              setState(() {
                _elemento.setOnline();
              });
          });
          Navigator.pop(context);
      }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _listItems.length,
          itemBuilder: (BuildContext context, int index) {
            return _listItems[index].render();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              _inputText = '';
              return Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      onChanged: (text) {
                        _inputText = text;
                      },
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _addItem,
                      child: Text('Agregar'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        tooltip: 'Añadir nuevo elemento',
        child: const Icon(Icons.add),
      ),
    );
  }
}
