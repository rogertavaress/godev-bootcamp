import Foundation

func isPalindrome(_ compare: String) -> Bool {
    let compareRaw = compare
        .folding(options: .diacriticInsensitive, locale: .current)
        .filter { $0.isLetter }
    let compareReverse = String(compareRaw.reversed())
    
    return compareReverse.uppercased() == compareRaw.uppercased()
}

func isPalindrome(_ compare: [String]) -> Bool {
    for text in compare {
        if !isPalindrome(text) {
            return false
        }
    }
    
    return true
}

isPalindrome("Soluço-me sem óculos")
isPalindrome("Eva, asse essa ave!")
isPalindrome("A torre da derrota")
isPalindrome("O galo ama o lago")
isPalindrome("O lobo ama o bolo")
isPalindrome("A base do teto desaba")
isPalindrome("O teu dueto")
isPalindrome("Oh nossas luvas avulsas, sonho…")
isPalindrome("A dama admirou o rim da amada")
isPalindrome("Laço bacana para panaca boçal")
isPalindrome("Soluço-me sem óculos")
isPalindrome("Até time demite, tá?")
isPalindrome("Ajudem Edu já")

isPalindrome([
    "Soluço-me sem óculos",
    "Eva, asse essa ave!",
    "A torre da derrota",
    "O galo ama o lago",
    "O lobo ama o bolo",
    "A base do teto desaba",
    "O teu dueto",
    "Oh nossas luvas avulsas, sonho…",
    "A dama admirou o rim da amada",
    "Laço bacana para panaca boçal",
    "Soluço-me sem óculos",
    "Até time demite, tá?",
    "Ajudem Edu já"
])
