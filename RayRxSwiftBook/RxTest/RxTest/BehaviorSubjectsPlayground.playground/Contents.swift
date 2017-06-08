//: Playground - noun: a place where people can play

import UIKit
import RxSwift

func print<T: CustomStringConvertible>(label: String, event: Event<T>){
    print(label, event.element ?? event.error ?? event)
}

enum MyError: Error {
    case anError
}

let subject = BehaviorSubject(value: "Initial value")
let disposeBag = DisposeBag()

subject.subscribe{
    print(label: "1)", event: $0)
}.addDisposableTo(disposeBag)

subject.onNext("X")

subject.onError(MyError.anError)
subject.subscribe{
    print(label: "2)", event: $0)
}.addDisposableTo(disposeBag)


var variable = Variable("Initial value")
//let disposeBag = DisposeBag()

variable.value = "New initial value"
variable.asObservable().subscribe{
    print(label: "1)", event: $0)
    }.addDisposableTo(disposeBag)
