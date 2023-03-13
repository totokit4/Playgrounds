import Foundation

let numbers = [1,2,3]
let words = ["い","ろ","は"]
func closureFunc(num: Int, word: String, cl:(String) -> Void) {
    cl("\(num): \(word)")
}

func test(_ numbers: [Int]) {
    for_i: for num in numbers {
        var flag = false
        for word in words {
            closureFunc(num: num, word: word) { string in
                print(string)
                if string == "2: ろ" {
                    // クロージャの中で二重ループを終了させたいが、`break for_i`は呼べない
                    flag = true
                }
            }

            if flag == true {
                print("ループ終了")
                break for_i
            }
        }
    }
}

test(numbers)
//1: い
//1: ろ
//1: は
//2: い
//2: ろ
//ループ終了
