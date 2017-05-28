//
//  LoginCoordinatorSpec.swift
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

import Foundation
import Quick
import Nimble

@testable import OctoViewer
class LoginCoordinatorSpec: QuickSpec {
  override func spec() {
    var coordinator: LoginCoordinator!
    var app: MockUIApplication!
    var vc: MockUIViewController!

    beforeEach {
      vc = MockUIViewController()
      app = MockUIApplication()

      coordinator = LoginCoordinator(navigationController: nil)
      coordinator.application = app

      app.keyWindow?.rootViewController = vc
      app.keyWindow?.makeKeyAndVisible()
    }

    it("presents a view on the application") {
      coordinator.start()

      expect(vc.presentedController).toNot(beNil())
      expect(vc.didPresent).to(beTruthy())
    }

    it("presents a view on the application, alternate call") {
      coordinator.presentLoginViewController()

      expect(vc.presentedController).toNot(beNil())
      expect(vc.didPresent).to(beTruthy())
    }

    describe("Generic coordinator functionality") {
      it("can add and remove a child") {
        let secondaryCoordinator = AppCoordinator()
        coordinator.addChild(coordinator: secondaryCoordinator)
        expect(coordinator.childCoordinators.contains(where: { $0 === secondaryCoordinator })).to(beTruthy())
        coordinator.removeChild(coordinator: secondaryCoordinator)
        expect(coordinator.childCoordinators.contains(where: { $0 === secondaryCoordinator })).to(beFalsy())
      }

      it("doesn't blow up trying to remove something that doesn't exit") {
        let secondaryCoordinator = AppCoordinator()
        coordinator.removeChild(coordinator: secondaryCoordinator)
      }
    }

  }
}
