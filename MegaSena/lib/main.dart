import 'package:flutter/material.dart';
import 'components/TaskCard.dart';
import 'AdicionaItemCompra.dart';
import 'components/Task.dart';

void main() {
  runApp(MaterialApp(
      theme:
          ThemeData(brightness: Brightness.light, primaryColor: Colors.purple),
      title: "Aplicativo Lista de Compras",
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

List<Task> _compras = [Task("Comprar tomate", true)];
int i = 0;

class _HomeState extends State<Home> {
  TextEditingController nameController = TextEditingController();
  TextEditingController subnameController = TextEditingController();
  void addItemToList() {
    setState(() {
      _compras.add(Task(nameController.text, true));
      i++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Basic List';
    return MaterialApp(
        title: title,
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: ListView.builder(
                          itemCount: _compras.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: TaskCard(_compras[index]),
                              onLongPress: () {
                                print(_compras[index].descricao);
                              },
                            );
                          })),
                ],
              )),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AdicionaItemCompra(_compras)),
              );
              setState(() {});
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ));
  }
}
