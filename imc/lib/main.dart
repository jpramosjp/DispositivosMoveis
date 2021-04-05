import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
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
  final valorPeso = TextEditingController();
  String peso = "0.0";
  final valorAltura = TextEditingController();
  String altura = "0.0";
  String imc = "0.0";


  String resultadoIMC(String peso, String altura){
    double pesoo = double.parse(peso);
    double alturaa = double.parse(altura);
    double imc = pesoo/(alturaa * alturaa);
    if(imc < 18.5){
      return "Peso baixo";
    }
    else if(imc >= 18.5 && imc <=24.9){
      return "Peso ideal";
    }
    else if(imc >= 25 && imc <=29.9){
      return "Acima do peso";
    }
    else if(imc > 29.9 && imc <=34.9){
      return "Obesidade 1";
    }
    else if(imc > 34.9 && imc <=39.9){
      return "Obesidade  Severa (Grau 2)";
    }
    else{
      return "Obesidade Mórbida (Grau 3";
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Cálculo IMC"),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: Color.fromRGBO(215,92,162,0.65),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: valorPeso,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(60.0)),
                    gapPadding: 01.0,
                    borderSide: BorderSide(),
                  ),
                  labelStyle: TextStyle(fontSize: 20, color: Colors.purple),
                  labelText: 'Digite seu peso',
                ),
              ),
              SizedBox(
                height: 60,
              ),
              TextField(
                controller: valorAltura,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(60.0)),
                    gapPadding: 01.0,
                    borderSide: BorderSide(),
                  ),
                  labelStyle: TextStyle(fontSize: 20, color: Colors.purple),
                  labelText: 'Digite sua altura',
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
                        final double valorPesoFinal = double.parse((valorPeso.text));
                      peso = "$valorPesoFinal";
                      final double valorAlturaFinal = double.parse((valorAltura.text));
                      altura = "$valorAlturaFinal";
                        imc = resultadoIMC(valorPeso.text,valorAltura.text);

                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Tela2(peso,altura,imc)),
                    );
                  },
                  child: Text('Calcular o IMC',
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
  final String pesoRecebido;
  final String alturaRecebida;
  final String resultadoIMC;

  Tela2(this.pesoRecebido,this.alturaRecebida,this.resultadoIMC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          color: Color.fromRGBO(215,92,162,0.65),
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Text(
                " $resultadoIMC",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    fontSize: 47),
              ),
              SizedBox(
                height: 80,
              ),
              Text('Peso: $pesoRecebido',
                  style: TextStyle(fontSize: 30.0, color: Colors.purple)),
              SizedBox(
                height: 40,
              ),
              Text('Altura: $alturaRecebida m',
                  style: TextStyle(fontSize: 30.0, color: Colors.purple)),
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
