// MARK: Dia: 07/03/2022

// MARK: var - mutable
var name: String = "INVALID-NAME"
name = "Rogério"

// MARK: let - not mutable
let age: Int = 25

// MARK: Interpolação
print("Meu nome é \(String(describing: name)) e tenho \(age) anos")

// MARK: Incrementos, operadores lógicos

let compairAge = age <= 18
let compairName = name == "Rogério"

// MARK: Inversão (!)

let isHidden: Bool = true
let isNotHidden = !isHidden

// MARK: AND (&&)

let isValid = true
let isEnable = isNotHidden && isValid

// MARK: OR (||)

let isEnableYet = isEnable || (isNotHidden && isValid)

// MARK: IF

if isEnableYet {
    print("Verdade! :D")
} else if !isValid {
    print("isValid")
} else {
    print("Falso :(")
}

// MARK: IF Ternário

let ternario = isEnableYet ? "Verdadeiro" : "Falso"

// MARK: Array - Coleção de dados

var cars: [String] = ["Fusca"]
cars.insert("Model Y", at: 0)
cars.append("Spin")
cars.removeFirst()
cars.removeLast()

// MARK: Dictionaries - Coleção de pares (Chave, Valor)

var populacao: [String: Int] = [
    "brazil": 123123,
    "chile": 121112
]

populacao["brazil"]
populacao["eua"]

populacao.removeValue(forKey: "chile")
