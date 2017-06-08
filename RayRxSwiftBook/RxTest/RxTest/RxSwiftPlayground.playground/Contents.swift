//: Playground - noun: a place where people can play

import UIKit
import RxCocoa
import RxSwift

let one  = 1
let two   = 2
let three = 3


let obser: Observable<Int> = Observable<Int>.just(one)
let obser2 = Observable.of(one, two, three)
let obser3 = Observable.of([one, two, three])
let obser4 = Observable.from([one, two, three])

let seque = 0..<3
var iterator = seque.makeIterator()
while let n = iterator.next() {
    print(n)
}

let one1       = 1
let two1       = 2
let three1     = 3
let observable = Observable.of(one, two, three)
observable.subscribe { event in
    print(event)
//    if let element = event.element {
//        print(element)
//    }
}

observable.subscribe(onNext: { (element) in
    print(element)
})

//检测空值后终止
let observable2 = Observable<Void>.empty()
observable2.subscribe(onNext: {
    ele in
    print(ele)
}, onCompleted:{
    print("Completed")
})

//检测never，永不终止，与empty相反
let observable3 = Observable<Any>.never()

observable3.subscribe(onNext: { (ele) in
    print(ele)
}, onCompleted: {
    //不会有completed输出
    print("Completed")
})


