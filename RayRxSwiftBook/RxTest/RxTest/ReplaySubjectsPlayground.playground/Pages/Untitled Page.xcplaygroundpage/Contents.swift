//: Playground - noun: a place where people can play

import UIKit
import RxSwift

func print<T: CustomStringConvertible>(label: String, event: Event<T>){
    print(label, event.element ?? event.error ?? event)
}

// 1
let subject = ReplaySubject<String>.create(bufferSize: 2)
let disposeBag = DisposeBag()
//重复size个响应
// 2
subject.onNext("1")
subject.onNext("2")
subject.onNext("3")
// 3
subject.subscribe{
    print(label: "1)", event: $0)
}.addDisposableTo(disposeBag)

subject.subscribe{
    print(label: "2)", event: $0)
}.addDisposableTo(disposeBag)
