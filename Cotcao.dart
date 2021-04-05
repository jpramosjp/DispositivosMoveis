import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final valorCotacao = TextEditingController();
  String cotacao = "0.0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Cotação de Moedas"),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: Color.fromRGBO(23, 57, 47, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: valorCotacao,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(60.0)),
                    gapPadding: 01.0,
                    borderSide: BorderSide(),
                  ),
                  labelStyle: TextStyle(fontSize: 20, color: Colors.orange),
                  labelText: 'Digite aqui!',
                ),
              ),
              SizedBox(
                height: 60,
              ),
              ButtonTheme(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      final double cotacaoMoeda = double.parse((valorCotacao.text));
                      cotacao = "$cotacaoMoeda";
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Tela2(cotacao)),
                    );
                  },
                  child: Text('Converter',
                      style: TextStyle(
                        fontSize: 30.0,
                      )),
                ),
              )
            ],
          ),
        ));
  
  }
}

class Tela2 extends StatelessWidget {
  final String _resultado;

  Tela2(this._resultado);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          color: Color.fromRGBO(23, 57, 47, 1),
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "   R\$: \n$_resultado",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                    fontSize: 40),
              ),
              SizedBox(
                height: 80,
              ),

              Text(
                'Dolar: \$${double.parse(_resultado) * 5.5}',
                style: TextStyle(
                        fontSize: 30.0,color: Colors.orange
                      )
              ),
             
              SizedBox(
                height: 40,
              ),
              
              Text(
                'Euro: €${double.parse(_resultado) * 7}',
                style: TextStyle(
                        fontSize: 30.0,color: Colors.orange
                      )
              ),
              
              SizedBox(
                height: 40,
              ),
              Text(
                'Ienes: ¥${double.parse(_resultado) * 0.5}',
                style: TextStyle(
                        fontSize: 30.0,color: Colors.orange
                      )
              ),

              
           
              
              SizedBox(
                height: 80,
              ),
              ElevatedButton(
               
                child: Text('Voltar',
                    style: TextStyle(
                      fontSize: 30.0,
                    )),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          )),
    );
  }
}
