import Foundation
import Combine

class Hoge: NSObject {
    @objc dynamic var test: Int = 0
    @Published var test2: Int = 0
}

class Fuga {
    var observers = [NSKeyValueObservation]()
    var cancellables: [AnyCancellable] = []

    var hoge = Hoge()

    init() {
        observers.append(hoge.observe(\Hoge.test, options: .new) { _, change in
            print("KVO値変更: \(change.newValue!)")
                })

        hoge.$test2
            .sink { change in
                print("combine値変更: \(change)")
            }.store(in: &cancellables)


        hoge.test = 1
        hoge.test2 = 1
    }
}

let fuga = Fuga()
// combine値変更: 0
// KVO値変更: 1
// combine値変更: 1
// →KVOだと、監視開始した直後に初期値の通知はこなくて、Combineだと、購読開始した直後に初期値の通知来る

