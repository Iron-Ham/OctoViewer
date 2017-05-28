//
//  AppDelegateViewModelSpec.swift
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

import Quick
import Nimble
import Moya
@testable import OctoViewer

class AppDelegateViewModelSpec: QuickSpec {
  override func spec() {
    var viewModel: AppDelegateViewModelType!
    var app: MockUIApplication!

    beforeEach {
      viewModel = AppDelegateViewModel(provider: RxMoyaProvider(stubClosure: MoyaProvider.immediatelyStub))
      app = MockUIApplication()
    }

    describe("open url") {
      var url: URL!

      beforeEach {
        url = URL(string: "octoviewer://auth?code=123_123_drink")
      }

      it("returns true") {
        let expected = viewModel.inputs.application(app: app, open: url, options: [:])
        expect(expected).to(beTruthy())
      }
    }

    it("is its own input") {
      expect(viewModel.inputs).to(beIdenticalTo(viewModel))
    }

    it("is its own output") {
      expect(viewModel.outputs).to(beIdenticalTo(viewModel))
    }

  }
}
