import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(children: [
              SizedBox(height: 20), // Añade 'const' aquí
              DropDown(
                items: ['Longitud', 'Masa', 'Volumen'],
                onChanged: (newValue) {
                  print(newValue);
                },
              ),
              SizedBox(height: 80), // Añade 'const' aquí
              Columna(),
            ]),
          ),
        ),
      ),
    );
  }
}

// Menu Dropdown

class DropDown extends StatefulWidget {
  final List<String> items;
  final void Function(String)? onChanged;
  const DropDown({required this.items, required this.onChanged});

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      value: _selectedValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
      onChanged: (String? newValue) {
        setState(() {
          _selectedValue = newValue;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(_selectedValue!);
        }
      },
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedValue = widget.items.first;
  }
}

// Columna con textfields y signo igual

class Columna extends StatefulWidget {
  @override
  _ClassColumn createState() => _ClassColumn();
}

class _ClassColumn extends State<Columna> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _textController1 = TextEditingController();
    TextEditingController _textController2 = TextEditingController();

    String _unidadEntrada = 'km';
    String _unidadSalida = 'm';

    String? _selectedValue;
    return Column(
      children: [
        TextField(
          controller: _textController1,
          onChanged: (value) {
            try {
              double valorDouble = double.parse(value);
              double resultado = convertidor(valorDouble, 'km', 'm');
              _textController2.text = resultado.toString();
            } on FormatException {
              _textController2.text = '';
            }
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        DropDown(
          items: ['km', 'm', 'cm'],
          onChanged: (newValue) {
            setState(() {
              _unidadEntrada = newValue;
            });
          },
        ),
        SizedBox(height: 20),
        Text('| |'),
        SizedBox(height: 20),
        TextField(
          controller: _textController2,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        DropDown(
            items: ['m', 'km', 'cm'],
            onChanged: (newValue) {
              setState(() {
                _unidadSalida = newValue;
              });
            }),
      ],
    );
  }
}

double convertidor(double unidad, String unidadEntrada, String unidadSalida) {
  final Map<String, double> mapaUnidades = {
    'm': 1,
    'km': 1000,
    'cm': 0.01,
  };

  // Convertir el valor de entrada a la unidad deseado
  double valor = unidad * mapaUnidades[unidadEntrada]!;

  // Convertir el valor de entrada a la unidad deseado
  double resultado = valor / mapaUnidades[unidadSalida]!;

  return resultado;
}
