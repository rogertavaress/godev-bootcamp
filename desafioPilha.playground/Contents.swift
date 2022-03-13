class Stack {
    typealias StackItemType = String
    typealias StackType = [StackItemType]
    
    private let TAG = "[Stack]"
    
    private var items: StackType
    private var maxLength: Int
    
    init(maxLength: Int) {
        self.maxLength = maxLength
        self.items = []
        print("\(TAG) Pilha criada!")
    }
    
    func push(_ item: StackItemType?) -> StackType {
        guard let item = item else {
            print("\(TAG) Não encontramos o item para adicionar")
            return items
        }
        
        if maxLength > items.count {
            items.append(item)
            print("\(TAG) Item adicionado (item: \(item))")
        } else {
            print("\(TAG) Pilha cheia (topo: \(maxLength))")
        }
        
        return items
    }
    
    func pop() -> StackItemType? {
        if items.isEmpty {
            print("\(TAG) Não possui valores para remover")
            return nil
        }
        let item = items.removeLast()
        print("\(TAG) Removemos o último (removido: \(item))")
        return item
    }
    
    func peek() -> StackItemType? {
        guard let item = items.last else {
            print("\(TAG) Vazia")
            return nil
        }
        print("\(TAG) Recuperamos o último item (item: \(item))")
        return item
    }
    
    func isFull() -> Bool {
        if maxLength == items.count {
            print("\(TAG) Cheia")
            return true
        }
        
        print("\(TAG) Ainda pode receber novos elementos (capacidade: \(maxLength))")
        return false
    }
    
    func isEmpty() -> Bool {
        let response = items.isEmpty
        
        if response {
            print("\(TAG) Vazia")
        } else {
            print("\(TAG) Com valores (quantidade: \(items.count))")
        }
        
        return response
    }
}

let pilha = Stack(maxLength: 3)

pilha.isFull()
pilha.isEmpty()
pilha.peek()
pilha.pop()
pilha.push("a")
pilha.pop()
pilha.push("a")
pilha.push("b")
pilha.push("c")
pilha.push("d")
pilha.peek()
pilha.isEmpty()
pilha.isFull()
