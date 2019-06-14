//
//  Unwrap.swift
//  AppleMediaDisplayer
//
//  Created by Atirek Sharma on 14/06/19.
//  Copyright © 2019 Atirek Sharma. All rights reserved.
//

//MARK:- MODULES
import Foundation
import UIKit
import RxSwift
import RxCocoa

//MARK:- PROTOCOL
protocol OptionalType { init() }

//MARK:- EXTENSIONS
extension String: OptionalType {}
extension Int: OptionalType {}
extension CGFloat: OptionalType {}
extension Double: OptionalType {}
extension Bool: OptionalType {}
extension Float: OptionalType {}
extension CGRect: OptionalType {}
extension UIImage: OptionalType {}
extension IndexPath: OptionalType {}
extension Array : OptionalType {}
extension Date: OptionalType{}


prefix operator /

//unwrapping values
prefix func /<T: OptionalType>( value: T?) -> T {
    guard let validValue = value else { return T() }
    return validValue
}

infix operator <

func <(d: Disposable,bag:DisposeBag){
    d.disposed(by: bag)
}

infix operator  <->
func <-> <T>(property: ControlProperty<T>, variable: Variable<T>) -> Disposable {
    let bindToUIDisposable = variable.asObservable()
        .bind(to: property)
    let bindToVariable = property
        .subscribe(onNext: { n in
            variable.value = n
        }, onCompleted:  {
            bindToUIDisposable.dispose()
        })
    
    return Disposables.create(bindToUIDisposable, bindToVariable)
}

func <-><T>(variable:Variable<T>,property:Binder<T>) -> Disposable {
    let bindToUI = variable.asObservable().bind(to: property)
    return bindToUI
}
