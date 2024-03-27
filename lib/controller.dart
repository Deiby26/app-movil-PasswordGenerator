import 'dart:math';

String minusculas(int indice) {
  List<String> contenedorMinusculas = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
  Random random = Random();
  String passwordgenereted = '';
  for (int i = 0; i < indice; i++){
    int indiceAleatorio = random.nextInt(contenedorMinusculas.length);
    passwordgenereted = passwordgenereted + contenedorMinusculas[indiceAleatorio];
  }
  return (passwordgenereted);
}


String mayusculas(int indice) {
  List<String> contenedormayusculas = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
  Random random = Random();
  String passwordgenereted = '';
  for (int i = 0; i < indice; i++){
    int indiceAleatorio = random.nextInt(contenedormayusculas.length);
    passwordgenereted = passwordgenereted + contenedormayusculas[indiceAleatorio];
  }
  return (passwordgenereted);
}

String numeros(int indice) {
  List<String> contenedor = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
  Random random = Random();
  String passwordgenereted = '';
  for (int i = 0; i < indice; i++){
    int indiceAleatorio = random.nextInt(contenedor.length);
    passwordgenereted = passwordgenereted + contenedor[indiceAleatorio];
  }
  return (passwordgenereted);
}

String caracteresEspeciales(int indice) {
  List<String> contenedor = ['!', '"', '#', '?', '%', '+', '!', '}', '{', '*', '&','|','°','<','>','-', '[', ']'];
  Random random = Random();
  String passwordgenereted = '';
  for (int i = 0; i < indice; i++){
    int indiceAleatorio = random.nextInt(contenedor.length);
    passwordgenereted = passwordgenereted + contenedor[indiceAleatorio];
  }
  return (passwordgenereted);
}


void main() {
  
}

