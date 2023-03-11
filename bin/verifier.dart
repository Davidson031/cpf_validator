import 'package:verifier/verifier.dart';


const List<String> listaDeCpfs = [
  "391.372.010-34",
  "764.792.346-34",
  "725.022.910-97",
  "212.959.340-27",
  "377.256.420-80",
  "423.504.370-60",
  "891.078.420-23",
  "672.717.030-47",
  "192.788.000-90",
  "907.441.190-81",
  "853.799.910-50",
  "630.462.920-66",
  "850.438.670-86",
  "696.523.150-52",
  "397.157.340-14",
];

void main(List<String> arguments) {

  listaDeCpfs.forEach((element) {
    print(VerificadorDeCpf(cpf: element).verificarCpf());
  });



}