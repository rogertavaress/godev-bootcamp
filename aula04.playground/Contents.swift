import UIKit

// MARK: Classes

class PersonClass {
    var name: String
    var lastName: String
    var age: Int
    
    init(name: String, lastName: String, age: Int) {
        self.name = name
        self.lastName = lastName
        self.age = age
    }
    
    func welcome() {
        print("Seja bem vindo, \(name) \(lastName)")
    }
}

let roger = PersonClass(name: "Roger", lastName: "Tavares", age: 25)

roger.welcome()

// MARK: Structs

struct PersonStruct {
    var name: String
    var lastName: String
    var age: Int
    
    func welcome() {
        print("Seja bem vindo, \(name) \(lastName)")
    }
}

var roger2 = PersonStruct(name: "Roger", lastName: "Tavares", age: 25)
var suelen = roger2

suelen.name = "Suelen"
suelen.lastName = "Bezérra"

roger2.welcome()
suelen.welcome()

// MARK: Protocolos

protocol Nota {
    func notaAluno()
}

protocol Materia {
    func materiaAluno()
}

// MARK: Extensões

class Aluno {
    var name: String?
    
    func getName() -> String {
        guard let name = self.name else { return ""  }
        
        return name
    }
    
    func setName(_ name: String) {
        self.name = name
    }
}

extension Aluno: Nota {
    func notaAluno() {
        guard let name = self.name else { return }
        print("Nota do aluno: \(name)")
    }
}

extension Aluno: Materia {
    func materiaAluno() {
        guard let name = self.name else { return }
        print("Materia do aluno: \(name)")
    }
}

// MARK: Literal

let color = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)

let lightBlue: UIColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)

let image = #imageLiteral(resourceName: "")

// MARK: Mais sobre Protocolos

protocol ReformarCampo {
 func plantarNovaGrama()
    func pintarNovasLinhas()
}

class EmpresaA: ReformarCampo {
    func plantarNovaGrama() {
        // let empregados = contratarEmpregador()
        // plantarGrama(empregados)
    }
    
    func pintarNovasLinhas() {
        // let empregados = contratarEmpregador()
        // pintarLinhas(empregados)
    }
}

class EmpresaB: ReformarCampo {
    func plantarNovaGrama() {
        // let maquinas = comprarMaquinas()
        // plantarGrama(maquinas)
    }
    
    func pintarNovasLinhas() {
        // let maquinas = comprarMaquinas()
        // pintarLinhas(maquinas)
    }
}
