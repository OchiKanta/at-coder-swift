class ABC085COtoshidama {
    static func run() {
        func readTwoInts() -> (billCount: Int, expectedAmount: Int) {
            let ints = readLine()!.split(separator: " ").map { Int($0)! }
            return (billCount: ints[0], expectedAmount:ints[1])
        }

        let (billCount, expectedAmount) = readTwoInts()
        var tenThousandYenCount = -1
        var fiveThousandYenCount = -1
        var thousandYenCount = -1

        for _tenThousandYenCount in 0...billCount {
            for _fiveThousandYenCount in 0...billCount {
                let _thousandYenCount = billCount - _fiveThousandYenCount - _tenThousandYenCount
                guard _thousandYenCount >= 0 else { continue }
                let amount = (_tenThousandYenCount * 10000) + (_fiveThousandYenCount * 5000) + (_thousandYenCount * 1000)
                if expectedAmount == amount {
                    tenThousandYenCount = _tenThousandYenCount;
                    fiveThousandYenCount = _fiveThousandYenCount;
                    thousandYenCount = _thousandYenCount;
                }
            }
        }
        print("\(tenThousandYenCount) \(fiveThousandYenCount) \(thousandYenCount)")
    }
}
