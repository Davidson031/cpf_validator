// ignore_for_file: public_member_api_docs, sort_constructors_first
class VerificadorDeCpf {

  String cpf;
  
  VerificadorDeCpf({
    required this.cpf,
  });
  
  bool verificarCpf(){

    final regexCpf = RegExp(r'^\d{3}\.\d{3}\.\d{3}\-\d{2}$');

    if(!regexCpf.hasMatch(cpf)) return false;

    List<String> digitosValidos = cpf.replaceAll(RegExp(r'[^0-9]'),'').split("");
    
    String segundoDigitoVerificadorInput = digitosValidos[digitosValidos.length - 1];
    String primeiroDigitoVerificadorInput = digitosValidos[digitosValidos.length - 2];

    int produtoNovePrimeirosDigitos = calcularSomaDosDigitos(digitosValidos, digitosValidos.length-2, digitosValidos.length-1);

    int produtoDezPrimeirosDigitos = calcularSomaDosDigitos(digitosValidos, digitosValidos.length-1, digitosValidos.length);

    if(!verificarDigitos(primeiroDigitoVerificadorInput, produtoNovePrimeirosDigitos) || !verificarDigitos(segundoDigitoVerificadorInput, produtoDezPrimeirosDigitos)) return false;

    return true;
  }


  int calcularSomaDosDigitos(List<String> digitos, int qtdDeDigitos, int offSetCalculo){

    int res =0;
    for(int i =0; i < (qtdDeDigitos); i++){
      res += (int.parse(digitos[i]) * offSetCalculo);
      offSetCalculo--;
    }

    return res;
  }

  bool verificarDigitos(String digito, int produto){

    if(produto % 11  < 2){
      if(int.parse(digito) != 0) {
        return false;
      }

    } else {
      if(int.parse(digito) != (11-(produto % 11))){
        return false;
      }
    }

    return true;
    
  }


}
