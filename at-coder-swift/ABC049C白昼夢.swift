import Foundation

enum ABC049C白昼夢Method {
    case allExtraction
    case dynamicProgramming
}

class ABC049C白昼夢 {
    static func run(method: ABC049C白昼夢Method) {
        
        switch method {
        case .allExtraction:
            allExtraction()
        case .dynamicProgramming:
            dynamicProgramming()
        }
        
    }
}

/// 後ろから全部調べる手法
private func allExtraction() {
    
    func readString() -> String {
        return readLine()!
    }
    
    var string = readString()
    let DREAM_STRING = "dream"
    let DREAMER_STRING = "dreamer"
    let ERASE_STRING = "erase"
    let ERASER_STRING = "eraser"
    
    var output = "YES"
    
    while true {
        if string.isEmpty { break }
        if string.hasSuffix(DREAMER_STRING) {
            string.removeLast(DREAMER_STRING.count)
            continue
        } else if string.hasSuffix(DREAM_STRING) {
            string.removeLast(DREAM_STRING.count)
            continue
        } else if string.hasSuffix(ERASER_STRING) {
            string.removeLast(ERASER_STRING.count)
            continue
        } else if string.hasSuffix(ERASE_STRING) {
            string.removeLast(ERASE_STRING.count)
            continue
        }
        output = "NO"
        break;
    }
    print(output)
    
}

/// 動的計画法
/// Stringから、特定のindexから特定のindexまでのStringが欲しい
/// だがRangeを使用するとTLEになるので、inputの文字列を全て配列に変換した上で計算する
/// https://qiita.com/nak435/items/422bfdaccd7121c20467
private func dynamicProgramming() {
    
    func readString() -> String {
        return readLine()!
    }
    
    let inputString = readString()
    let inputStringArray = inputString.map{String($0)}
    let devidingStrings = ["dream", "dreamer", "erase", "eraser"]
    var dynamicProgrammingValues = [Bool](repeating: false, count: 100100)
    
    dynamicProgrammingValues[0] = true
    for i in 0..<inputString.count {
        guard dynamicProgrammingValues[i] else { continue }
        for devidingString in devidingStrings {
            var devidedString = ""
            for i2 in i..<i + devidingString.count {
                // out range
                if i2 >= inputStringArray.count {continue}
                devidedString.append(inputStringArray[i2])
            }
            if devidedString == devidingString {
                dynamicProgrammingValues[i + devidingString.count] = true
            }
        }
    }
    print(dynamicProgrammingValues[inputString.count] ? "YES" : "NO")
}
