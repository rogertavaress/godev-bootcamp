import UIKit
import Darwin

// MARK: Opcional

var message: String?
message = "Minha mensagem"

// MARK: If let

if let text = message {
    text
}

// MARK: Guard let

func icon() -> UIImage? {
    guard let image = UIImage(named: "Photo") else {
        return UIImage(named: "Default")
    }
    return image
}

// MARK: Função

func myCar(is car: String?) {
    guard let car = car else {
        return
    }
    print("Meu carro: \(car)")
}

myCar(is: "Model S")

// MARK: Função com retorno

typealias Name = String

func getName(_ name: String) -> Name {
    return name
}

getName("Rogério")

// MARK: Função com retorno (uma linha)

typealias Lastname = String

func getLastname(_ lastname: String) -> Lastname {
    lastname
}

getLastname("Tavares")

// MARK: Closures

typealias callbackMakeBuy = (Int) -> Void

func makeBuy(onCompletion: callbackMakeBuy,
             onError: callbackMakeBuy) {
    onCompletion(10)
    onError(0)
}

makeBuy(onCompletion: { success in
    print(success)
}, onError: { error in
    print(error)
})

makeBuy { success in
    print(success)
} onError: { error in
    print(error)
}

makeBuy {
    print($0)
} onError: {
    print($0)
}


