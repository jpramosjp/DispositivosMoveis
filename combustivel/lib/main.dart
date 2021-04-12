import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        
        primarySwatch: Colors.yellow,
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
  final valorGasolina = TextEditingController();
  String gasolina = "0.0";
  final ValorEtanol = TextEditingController();
  String etanol = "0.0";
  String melhorPreco = "0.0";


  String resultadoMelhorPreco(String gasolina, String etanol){
    double gasolinaa = double.parse(gasolina);
    double alcoll = double.parse(etanol);
    double melhorPreco = alcoll/gasolinaa;
    if(melhorPreco < 0.7){
      return "Etanol é a melhor opcão";
    }
    else{
      return "Gasolina é a melhor opcão";
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Cálculo Combustivel"),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: Color.fromRGBO(147,149,151,1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: valorGasolina,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(60.0)),
                    gapPadding: 01.0,
                    borderSide: BorderSide(),
                  ),
                  labelStyle: TextStyle(fontSize: 20, color: Colors.yellow),
                  labelText: 'Digite o preço da gasolina',
                ),
              ),
              SizedBox(
                height: 60,
              ),
              TextField(
                controller: ValorEtanol,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(60.0)),
                    gapPadding: 01.0,
                    borderSide: BorderSide(),
                  ),
                  labelStyle: TextStyle(fontSize: 20, color: Colors.yellow),
                  labelText: 'Digite o preço do Etanol',
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
                        final double valorGasolinaFinal = double.parse((valorGasolina.text));
                      gasolina = "$valorGasolinaFinal";
                      final double ValorEtanolFinal = double.parse((ValorEtanol.text));
                      etanol = "$ValorEtanolFinal";
                        melhorPreco = resultadoMelhorPreco(valorGasolina.text,ValorEtanol.text);

                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Tela2(gasolina,etanol,melhorPreco)),
                    );
                  },
                  child: Text('Calcular o preço',
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
  final String gasolinaRecebido;
  final String EtanolRecebida;
  final String resultadomelhorPreco;

  Tela2(this.gasolinaRecebido,this.EtanolRecebida,this.resultadomelhorPreco);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          color: Color.fromRGBO(147,149,151,1),
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Text(
                " $resultadomelhorPreco",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                    fontSize: 40),
              ),
              SizedBox(
                height: 80,
              ),
              Text('Gasolina: R\$ $gasolinaRecebido',
                  style: TextStyle(fontSize: 30.0, color: Colors.yellow),
              ),
              SizedBox(
                height: 40,
              ),
              Text('Etanol: R\$ $EtanolRecebida',
                  style: TextStyle(fontSize: 30.0, color: Colors.yellow)),
              SizedBox(
                height: 40,
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
