class Pilha {
    typealias PilhaItemType = String
    typealias PilhaType = [PilhaItemType]
    
    private var itens: PilhaType
    
    init() {
        self.itens = []
    }
    
    init(_ itens: PilhaType) {
        self.itens = itens
    }
    
    // MARK: - Adicionar
    
    func adicionar(_ item: PilhaItemType?) -> PilhaType {
        guard let item = item else { return self.itens }
        
        self.itens.append(item)
        
        return self.itens
    }
    
    func adicionar(_ itens: PilhaType) -> PilhaType {
        for item in itens {
            self.itens.append(item)
        }
        
        return self.itens
    }
    
    // MARK: - Remover
    
    func remover(_ item: PilhaItemType?) -> PilhaType {
        guard let item = item else { return self.itens }
        
        guard let index = self.itens.firstIndex(of: item) else {
            return self.itens
        }
        
        itens.remove(at: index)
        
        
        return self.itens
    }
    
    func remover(_ itens: PilhaType) -> PilhaType {
        for item in itens {
            self.remover(item)
        }
        
        return self.itens
    }
    
    func removerTodos() {
        self.itens.removeAll()
    }
    
    // MARK: - Buscar
    
    func buscar(index: Int) -> PilhaItemType? {
        if !(0..<self.itens.count ~= index) {
            return nil
        }
        return self.itens[index]
    }
    
    func buscarTodos() -> PilhaType {
        self.itens
    }
    
    // MARK: - Verificar
    
    func tem(_ item: PilhaItemType) -> Bool {
        guard let _ = self.itens.firstIndex(of: item) else {
            return false
        }
        
        return true
    }
}

let pilha = Pilha()

pilha.adicionar("1")
pilha.adicionar(["2", "3"])
pilha.buscar(index: 0)
pilha.buscar(index: 3)
pilha.buscarTodos()
pilha.tem("2")
pilha.tem("0")
pilha.remover("3")
pilha.remover(["2", "1", "0"])
pilha.adicionar("0")
pilha.removerTodos()
