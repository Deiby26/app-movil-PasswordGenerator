import 'package:flutter/material.dart';
import 'controller.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

String combinarStrings(
    String string1, String string2, String string3, String string4) {
  int minLength = [
    string1.length,
    string2.length,
    string3.length,
    string4.length
  ].reduce((a, b) => a < b ? a : b);
  StringBuffer resultado = StringBuffer();
  for (int i = 0; i < minLength; i++) {
    resultado.write(string1[i] + string2[i] + string3[i] + string4[i]);
  }
  resultado.write(string1.substring(minLength) +
      string2.substring(minLength) +
      string3.substring(minLength) +
      string4.substring(minLength));
  return resultado.toString();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _currentSliderValue = 4;
  List<bool> listaControlador = [];
  //checkbox
  bool ischekedMinus = false;
  bool ischekedMayus = false;
  bool ischekednum = false;
  bool ischekedEspecial = false;

  static const data = "Password Generator";
  String passwordminus = '';
  String passwordmayus = '';
  String passwordnums = '';
  String passwordEspecial = '';

  String passwordCompleted = '';
  String passwordTotal = '';
  List<String> caracteresAleatorios = [];

  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 113, 124, 121),
        title: Text(data),
      ),
      body: Column(
        children: [
          const Text("Password length"),
          Slider(
              value: _currentSliderValue,
              min: 4,
              max: 15,
              label: _currentSliderValue.round().toString(),
              divisions: 11,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              }),
          CheckboxListTile(
              title: const Text("Lower case"),
              value: ischekedMinus,
              onChanged: (bool? value) {
                setState(() {
                  ischekedMinus = value!;
                });
              }),
          CheckboxListTile(
              title: const Text("capital letters"),
              value: ischekedMayus,
              onChanged: (bool? value) {
                setState(() {
                  ischekedMayus = value!;
                });
              }),
          CheckboxListTile(
              title: const Text("Numbers"),
              value: ischekednum,
              onChanged: (bool? value) {
                setState(() {
                  ischekednum = value!;
                });
              }),
          CheckboxListTile(
              title: const Text("special characters"),
              value: ischekedEspecial,
              onChanged: (bool? value) {
                setState(() {
                  ischekedEspecial = value!;
                });
              }),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  passwordTotal = '';
                  listaControlador.add(ischekedMinus);
                  listaControlador.add(ischekedMayus);
                  listaControlador.add(ischekednum);
                  listaControlador.add(ischekedEspecial);

                  if (listaControlador[0] == true) {
                    passwordminus = minusculas(_currentSliderValue.toInt());
                  } else {
                    passwordminus = '';
                  }
                  if (listaControlador[1] == true) {
                    passwordmayus = mayusculas(_currentSliderValue.toInt());
                  } else {
                    passwordmayus = '';
                  }
                  if (listaControlador[2] == true) {
                    passwordnums = numeros(_currentSliderValue.toInt());
                  } else {
                    passwordnums = '';
                  }
                  if (listaControlador[3] == true) {
                    passwordEspecial =
                        caracteresEspeciales(_currentSliderValue.toInt());
                  } else {
                    passwordEspecial = '';
                  }

                  passwordCompleted = combinarStrings(passwordminus,
                      passwordmayus, passwordnums, passwordEspecial);
                  Random random = Random();
                  for (int i = 0; i < _currentSliderValue; i++) {
                    int indiceAleatorio =
                        random.nextInt(passwordCompleted.length);
                    caracteresAleatorios
                        .add(passwordCompleted[indiceAleatorio]);
                  }

                  for (int j = 0; j < caracteresAleatorios.length; j++) {
                    passwordTotal = passwordTotal + caracteresAleatorios[j];
                  }

                  caracteresAleatorios.clear();

                  listaControlador.clear();
                });
              },
              child: const Text("Generate password")),
          Text('Password:  $passwordTotal'),
          Image.network(
            width: 200,
            height: 250,
             'https://cdn-icons-png.flaticon.com/512/269/269099.png')
        ],
      ),
    );
  }
}
