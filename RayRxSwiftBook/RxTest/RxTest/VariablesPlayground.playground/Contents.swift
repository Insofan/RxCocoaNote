//: Playground - noun: a place where people can play

import UIKit
import RxSwift

func print<T: CustomStringConvertible>(label: String, event: Event<T>){
    print(label, event.element ?? event.error ?? event)
}

var variable = Variable("Initial value")
let disposeBag = DisposeBag()

variable.value = "New initial value"
variable.asObservable().subscribe{
    print(label: "1)", event: $0)
}.addDisposableTo(disposeBag)
variable.value = "1"
variable.asObservable().subscribe{
    print(label: "2)", event: $0)
}.addDisposableTo(disposeBag)
variable.value = "2"
