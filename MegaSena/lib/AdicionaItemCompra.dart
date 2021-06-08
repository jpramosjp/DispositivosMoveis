import 'package:flutter/material.dart';
import 'components/Task.dart';

class AdicionaItemCompra extends StatefulWidget {
  List<Task> compras;
  AdicionaItemCompra(this.compras);
  @override
  _AdicionaItemCompraState createState() => _AdicionaItemCompraState();
}

class _AdicionaItemCompraState extends State<AdicionaItemCompra> {
  TextEditingController titulo = TextEditingController();
  TextEditingController subTitulo = TextEditingController();

  void addItemToList() {
    setState(() {
      widget.compras.add(Task(titulo.text, true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Adicione o item a Lista"),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 15.0,
                  ),
                  TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              gapPadding: 01.0,
                              borderSide: BorderSide()),
                          labelText: "Nome do item: "),
                      controller: titulo),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            gapPadding: 01.0,
                            borderSide: BorderSide()),
                        labelText: "Preço do Item: "),
                    keyboardType: TextInputType.number,
                    controller: subTitulo,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  RaisedButton(
                      child: Text(
                        "ADICIONAR",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        addItemToList();
                        Navigator.pop(context);
                      })
                ],
              ),
            )));
  }
}
