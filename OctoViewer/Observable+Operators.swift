//
//  Observable+Operators.swift
//  OctoViewer
//
//  Created by Hesham Salman on 5/25/17.
//  Copyright © 2017 Hesham Salman
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import RxSwift

extension Observable where Element: Equatable {
  func ignore(value: Element) -> Observable<Element> {
    return filter { event -> Bool in
      return value != event
    }
  }
}

protocol OptionalType {
  associatedtype Wrapped

  var value: Wrapped? { get }
}

extension Optional: OptionalType {
  var value: Wrapped? {
    return self
  }
}

extension Observable where Element: OptionalType {
  func filterNil() -> Observable<Element.Wrapped> {
    return flatMap { (element) -> Observable<Element.Wrapped> in
      if let value = element.value {
        return .just(value)
      } else {
        return .empty()
      }
    }
  }

  func filterNilKeepOptional() -> Observable<Element> {
    return self.filter { (element) -> Bool in
      return element.value != nil
    }
  }

  func replaceNil(with nilValue: Element.Wrapped) -> Observable<Element.Wrapped> {
    return flatMap { (element) -> Observable<Element.Wrapped> in
      if let value = element.value {
        return .just(value)
      } else {
        return .just(nilValue)
      }
    }
  }
}

extension Observable {
  func doOnNext(_ closure: @escaping (Element) -> Void) -> Observable<Element> {
    return self.do(onNext: { (element) in
      closure(element)
    })
  }

  func doOnCompleted(_ closure: @escaping () -> Void) -> Observable<Element> {
    return self.do(onCompleted: {
      closure()
    })
  }

  func doOnError(_ closure: @escaping (Error) -> Void) -> Observable<Element> {
    return self.do(onError: { (error) in
      closure(error)
    })
  }
}

private let backgroundScheduler = SerialDispatchQueueScheduler(qos: .default)

extension Observable {
  func mapReplace<T>(with value: T) -> Observable<T> {
    return map { _ -> T in
      return value
    }
  }

  func dispatchAsyncMainScheduler() -> Observable<E> {
    return self.observeOn(backgroundScheduler).observeOn(MainScheduler.instance)
  }
}

protocol BooleanType {
  var boolValue: Bool { get }
}
extension Bool: BooleanType {
  var boolValue: Bool { return self }
}

// Maps true to false and vice versa
extension Observable where Element: BooleanType {
  func not() -> Observable<Bool> {
    return self.map { input in
      return !input.boolValue
    }
  }
}

extension Collection where Iterator.Element: ObservableType, Iterator.Element.E: BooleanType {

  func combineLatestAnd() -> Observable<Bool> {
    return Observable.combineLatest(self) { bools -> Bool in
      return bools.reduce(true, { (memo, element) in
        return memo && element.boolValue
      })
    }
  }

  func combineLatestOr() -> Observable<Bool> {
    return Observable.combineLatest(self) { bools in
      bools.reduce(false, { (memo, element) in
        return memo || element.boolValue
      })
    }
  }
}

extension ObservableType {

  func then(_ closure: @escaping () -> Observable<E>?) -> Observable<E> {
    return then(closure() ?? .empty())
  }

  func then( _ closure: @autoclosure @escaping () -> Observable<E>) -> Observable<E> {
    let next = Observable.deferred {
      return closure()
    }

    return self
      .ignoreElements()
      .concat(next)
  }
}

extension Observable {
  func mapToOptional() -> Observable<Element?> {
    return map { Optional($0) }
  }
}

func sendDispatchCompleted<T>(to observer: AnyObserver<T>) {
  DispatchQueue.main.async {
    observer.onCompleted()
  }
}
