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

    //List<String> digitosValidos = [];

    // cpf.split("").forEach((digito) { 
    //   if(digito != "." && digito != "-"){
    //     digitosValidos.add(digito);
    //   }
    // });
    

    String segundoDigitoVerificadorInput = digitosValidos[digitosValidos.length - 1];
    String primeiroDigitoVerificadorInput = digitosValidos[digitosValidos.length - 2];

    int offSetParaSomaNoveDigitos = digitosValidos.length-1;
    int produtoNovePrimeirosDigitos = 0;
    
    for(int i =0; i < (digitosValidos.length-2); i++){
      produtoNovePrimeirosDigitos += (int.parse(digitosValidos[i]) * offSetParaSomaNoveDigitos);
      offSetParaSomaNoveDigitos--;
    }

    //verificando validade do primeiro digito verificador
    if(produtoNovePrimeirosDigitos % 11  < 2){
      if(int.parse(primeiroDigitoVerificadorInput) != 0) return false;
    } else {
      if(int.parse(primeiroDigitoVerificadorInput) != (11-(produtoNovePrimeirosDigitos % 11))) return false;
    }


    //verificando validade do segundo digito verificador
    int produtoDezPrimeirosDigitos =0;
    int offSetParaSomaDezDigitos = digitosValidos.length;

    for(int i =0; i < (digitosValidos.length-1); i++){
      produtoDezPrimeirosDigitos += (int.parse(digitosValidos[i]) * offSetParaSomaDezDigitos);

      offSetParaSomaDezDigitos--;

    }

    if(produtoDezPrimeirosDigitos % 11 < 2){
      if(int.parse(segundoDigitoVerificadorInput) != 0) return false;
    } else{ 
      if(int.parse(segundoDigitoVerificadorInput) != (11-(produtoDezPrimeirosDigitos % 11))) return false;
    }




    return true;
  }
}
