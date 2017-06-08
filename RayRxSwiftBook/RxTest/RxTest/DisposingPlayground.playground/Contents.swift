//: Playground - noun: a place where people can play

import UIKit
import RxSwift

let observable = Observable.of("A", "B", "C")
observable.subscribe { (event) in
    print(event)
}

//Managing each subscription individually would be tedious, so RxSwift includes a DisposeBag type. A dispose bag holds disposables — typically added using
//the .addDisposableTo() method — and will call dispose() on each one when the dispose bag is about to be deallocated.
let disposeBag = DisposeBag()

observable.subscribe{
    print($0)
}.addDisposableTo(disposeBag)


//The create operator takes a single parameter named subscribe. Its job is to provide the implementation of calling subscribe on the observable.

//Observable<String>.create { observer in
//   observer.onNext("1")
//    observer.onCompleted()
//    observer.onNext("?")
//    return Disposables.create()
//}.subscribe(
//    onNext:{print($0)},
//    onError:{print($0)},
//    onCompleted:{print("Completed")},
//    onDisposed: {print("Disposed")}
//).addDisposableTo(disposeBag)

//What would happen if you emitted neither a .completed nor a .error event, and didn’t add the subscription to disposeBag? Comment out the observer.onError, observer.onCompleted and addDisposableTo(disposeBag) lines of code to find out. Here’s the complete implementation:

enum MyError: Error {
    case anError
}
//let disposeBag = DisposeBag()
Observable<String>.create { observer in
    // 1
    observer.onNext("1")
    //    observer.onError(MyError.anError)
    // 2
    //    observer.onCompleted()
    // 3
    observer.onNext("?")
    // 4
    return Disposables.create()
    }
    .subscribe(
        onNext: { print($0) },
        onError: { print($0) },
        onCompleted: { print("Completed") },
        onDisposed: { print("Disposed") }
)
//    .addDisposableTo(disposeBag)
//会内存泄漏

var flip = false

let factory: Observable<Int> = Observable.deferred {
    flip = !flip
    
    if flip  {
        return Observable.of(1, 2, 3)
        }else {
        return Observable.of(4, 5, 6)
    }
    
}

for _ in 0...3 {
    factory.subscribe(onNext: {
        print($0, terminator:"")
    }).addDisposableTo(disposeBag)
    print()
}
