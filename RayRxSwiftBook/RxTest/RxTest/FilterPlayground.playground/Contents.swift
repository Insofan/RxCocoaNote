//: Playground - noun: a place where people can play

import UIKit
import RxSwift

let strikes = PublishSubject<String>()
let disposeBag = DisposeBag()
/*
// ignore
//1.第一个过滤三个事件
//ignoreElements ignore all .next event
strikes.ignoreElements().subscribe{ _  in
    print("You're out")
}.addDisposableTo(disposeBag)

strikes.onNext("X")
strikes.onNext("X")
strikes.onNext("X")
//忽略了next，但是onCompleted就触发了 You're out
strikes.onCompleted()
*/

/*
//elementAt
//2.不过滤index 1 的元素，就是second
strikes.elementAt(2).subscribe(onNext: { _ in
    print("You're out")
}).addDisposableTo(disposeBag)
//上面是ignoreall，but 3rd 。next event
strikes.onNext("X")
strikes.onNext("X")
strikes.onNext("X")
*/

/*
//filter
//3.过滤元素
//输出偶数
Observable.of(1, 2, 3, 4, 5, 6).filter { integer in
    integer % 2 == 0
}
.subscribe(onNext:{
    print($0)
    }).addDisposableTo(disposeBag)
*/


/*
//skip
//4.跳过,skip 2是跳过前两个元素
Observable.of("A", "B", "C", "D", "E", "F")
.skip(3)
    .subscribe(onNext:{
        print($0)
    }).addDisposableTo(disposeBag)
//skipWhile:it will only skip up untill something is not skipped
//2, 2, 3, 3, 4 直到3不是偶数 跳过前两个2
Observable.of(2, 2, 3, 4, 4)
    .skipWhile{ integer in
        integer % 2 == 0
}
.subscribe(onNext: {
        print($0)
})
.addDisposableTo(disposeBag)

let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()

//skipUntil，Doing so cases skipUntil to stop skipping.直到发生trigger才停止skip
subject.skipUntil(trigger)
    .subscribe(onNext:{
        print($0)
    })
.addDisposableTo(disposeBag)

subject.onNext("A")
subject.onNext("B")
subject.onNext("C")
trigger.onNext("触发")
subject.onNext("D")
*/

/*
//Taking operators
//与skip相反操作
Observable.of(1, 2, 3, 4, 5, 6)
.take(3).subscribe(onNext: { 
    print($0)
}).addDisposableTo(disposeBag)


Observable.of(2, 2, 4, 4, 6, 6)
    .takeWhileWithIndex{value, index in
        value % 2 == 0 && index < 3
}
.subscribe(onNext:{
        print($0)
})
.addDisposableTo(disposeBag)

*/

/*
//takeUntil
let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()

subject.takeUntil(trigger)
    .subscribe(onNext:{
        print($0)
    }).addDisposableTo(disposeBag)

subject.onNext("1")
subject.onNext("2")
trigger.onNext("X")
subject.onNext("3")
*/

//Distinct，只允许还没有发射过的数据项通过, https://mcxiaoke.gitbooks.io/rxdocs/content/operators/Distinct.html
Observable.of("A", "A", "B", "C", "C")
    .distinctUntilChanged().subscribe(onNext:{
        print($0)
    }).addDisposableTo(disposeBag)

//distinctUntilChanged, 它只判定一个数据和它的直接前驱是否是不同的

let formatter = NumberFormatter()
formatter.numberStyle = .spellOut
Observable<NSNumber>.of(10, 110, 20, 200, 210, 310)
    .distinctUntilChanged{ a, b in
        guard let aWords = formatter.string(from: a)?.components(separatedBy: " "), let bWords = formatter.string(from: b)?.components(separatedBy: " ")
            else {
                return false
        }
        
        var containsMatch = false
        
        for aWord in aWords {
            for bWord in bWords {
                if aWord == bWord {
                    containsMatch = true
                    break
                }
            }
        }
        return containsMatch
}
    .subscribe(onNext:{
        print($0)
    }).addDisposableTo(disposeBag)






