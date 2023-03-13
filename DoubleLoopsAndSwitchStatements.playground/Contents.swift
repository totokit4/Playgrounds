import Foundation
let numbers = [1,2,3]
let words = ["い","ろ","は"]

// そもそもforEachはbreakでは抜けられない
numbers.forEach { num in
    words.forEach { word in
        switch word {
        case "ろ": break // forEachのループは抜けてくれない
        default: break
        }
        print("\(num),\(word)")
    }
}

// for-inにしてもswitchの中のbreakはループを抜けない
for num in numbers {
    for word in words {
        switch word {
        case "ろ": break // for-inのループは抜けてくれない
        default: break
        }
        print("\(num),\(word)")
    }
}

// for-inとifだとループを抜ける
for num in numbers {
    for word in words {
        if word == "ろ" {
            break // wordsのループを抜ける
        }
        print("\(num),\(word)")
    }
}

// ループにラベルをつけると二重ループを抜けられる
for_num: for num in numbers {
    for word in words {
        if word == "ろ" {
            break for_num // numbersのループを抜ける
        }
        print("\(num),\(word)")
    }
}

// ループにラベルをつけるとswitchの中のbreakでループを抜けられる
for_num: for num in numbers {
    for word in words {
        switch word {
        case "ろ": break for_num //  numbersのループを抜ける
        default: break
        }
        print("\(num),\(word)")
    }
}
