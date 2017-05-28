//
//  Coordinator.swift
//  OctoViewer
//
//  Created by Hesham Salman on 5/26/17.
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

import UIKit

protocol Coordinator: class {
  var childCoordinators: [Coordinator] { get set }
  var navigationController: UINavigationController? { get set }

  func start()
}

extension Coordinator {
  func addChild(coordinator: Coordinator) {
    childCoordinators.append(coordinator)
  }

  func removeChild(coordinator: Coordinator) {
    guard let index = childCoordinators.index(where: { $0 === coordinator }) else {
      return
    }
    childCoordinators.remove(at: index)
  }
}

extension Coordinator {
  func presentLoginViewController() {
    let coordinator = LoginCoordinator()
    coordinator.start()
  }
}
