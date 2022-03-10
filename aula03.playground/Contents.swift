// MARK: Switch

let notaMedia = 5

switch notaMedia {
case 0..<6:
    "Reprovado"
case 6..<8:
    "Passou!"
case 8...10:
    "Parabens!"
default:
    "Error"
}

// MARK: Enum

enum Aluno {
    case Joao
    case Pedro
    case Roger
}

let aluno: Aluno = .Roger

enum State {
    case Success
    case Error
    case Loading
}

let state: State = .Loading

// MARK: Switch com Enum

switch aluno {
case .Roger: "Rogério"
case .Joao: "João"
case .Pedro: "Pedro"
}

switch state {
case .Success: "Sucesso"
case .Error: "Falha"
case .Loading: "Carregando"
}

// MARK: Enum tipado

enum StateRequest: String {
case success = "Efetuado com sucesso"
case failure = "Falha, tente novamente"
}

StateRequest.success.rawValue

// MARK: Enum com valores

enum BankDeposit {
    case inValue(Int)
    case inCheck(Bool)
}

func makeDeposit(values: BankDeposit) {
    switch values {
    case .inValue(let value):
        "O valor passado é \(value)"
    case .inCheck(let isCheck):
        "In check \(isCheck)"
    }
}

let deposit = BankDeposit.inValue(10)

makeDeposit(values: deposit)

// MARK: Programação funcional

var estudantes = ["Samuel", "Roger", "Ana", "Suelen"]

estudantes.sorted()

estudantes.sort { (lhs: String, rhs: String) in
    return lhs > rhs
}

estudantes

// MARK: Merge de Array

let array1 = ["Roger"]
let array2 = ["Tavares"]

array1 + array2

// MARK: Array Map

let alunosNota = [4, 5, 1, 9]

let novaAlunosNota = alunosNota.map { $0 + 1 }

alunosNota
novaAlunosNota

// MARK: Array Filter

let aprovadosNota = novaAlunosNota.filter { $0 >= 6 }

aprovadosNota

// MARK: Array Reduce

let valores = [10, 20, 100, 40]

let valorTotal = valores.reduce(0) { partialResult, value in
    partialResult + value
}

let valorTotal2 = valores.reduce(0, +)
