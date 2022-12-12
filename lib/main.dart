import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() {
  runApp(MaterialApp(
    localizationsDelegates: [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      // GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: S.delegate.supportedLocales,
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int lang = 0;
  List lLang = S.delegate.supportedLocales;
  String sLang = 'pt';
  String sFlag = 'images/pt.jpg';

  String _pesoIdeal = "";
  int _unit = 0;
  List<String> _units = ['kg', 'cm', 'lb', 'in'];
  String _infoText = "";

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _formKey = GlobalKey<FormState>();
      _pesoIdeal = "";
      _infoText = "";     
    });
  }

  void _calculate() {
    setState(() {
      // imc = P/H^2   bmi= 703P/H^2
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      double idealInf = height * height * 18.7;
      double idealSup = height * height * 24.8;
      if (_unit == 2) {
        imc *= .0703;           //  703/100^2
        idealInf *= 14.224751;  // 14.224751 = 100^2/703
        idealSup *= 14.224751;
      }
      if (imc < 18.6) {
        _infoText = "${S.of(context).underWeight} ${imc.toStringAsPrecision(3)})";
        _pesoIdeal =
            "${S.of(context).tryToReach} ${idealInf.toStringAsFixed(0)} ${_units[_unit]}";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "${S.of(context).rightWeight} ${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText =
            "${S.of(context).slightlyOverweight} ${imc.toStringAsPrecision(3)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "${S.of(context).class1} ${imc.toStringAsPrecision(3)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "${S.of(context).class2} ${imc.toStringAsPrecision(3)})";
      } else if (imc >= 40) {
        _infoText = "${S.of(context).class3} ${imc.toStringAsPrecision(3)})";
      }
      if (imc >= 24.9) {
        _pesoIdeal =
            "${S.of(context).tryToReach} ${idealSup.toStringAsFixed(0)} ${_units[_unit]}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: AppBar(
        title: Text(S.of(context).bmiCalculator),
        centerTitle: false,
        backgroundColor: Colors.blue,
        actions: <Widget>[     
          IconButton(
            tooltip: sLang,
            icon: Image.asset(sFlag),
            iconSize: 24,
            onPressed: () {
              // setState(() {        
                lang == lLang.length - 1 ? lang=0 : lang++;
                sLang= lLang[lang].toString();
                S.load(Locale(sLang));
                var tmp= sLang;                
                if (lang == lLang.length - 1 ) {
                  tmp= lLang[0].toString();
                } else{
                  tmp= lLang[lang + 1].toString();
                }                
                sFlag = 'images/$tmp.jpg';
                _resetFields();
              // }); 
              // _calculate(); 
              // setState(() {
              //   ;
              // });                         
            },     
          ),     
          TextButton(
            child: Text(
              _unit == _units.length - 2
              ? ' ${_units[0]}/${_units[1]}'
              : ' ${_units[_unit+2]}/${_units[_unit+3]}',             
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.white,
              ),
            ),
            onPressed: () {
              _unit == 0 ? _unit = 2 : _unit = 0;
              _resetFields();              
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_outline_outlined, size: 120.0, color: Colors.blue),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "${S.of(context).weight} (${_units[_unit]})",
                    labelStyle: TextStyle(color: Colors.blue)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
                controller: weightController,
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return "Insira seu Peso!";
                //   }
                // },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "${S.of(context).height} (${_units[_unit+1]})",
                    labelStyle: TextStyle(color: Colors.blue)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
                controller: heightController,
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return "Insira sua Altura!";
                //   }
                // },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _calculate();
                      }
                    },
                    child: Text(
                      S.of(context).calculate,
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    // color: Colors.blue,f
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
              ),
              Text(
                _pesoIdeal,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  } 
}
