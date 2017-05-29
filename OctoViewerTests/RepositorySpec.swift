//
//  RepositorySpec.swift
//  OctoViewer
//
//  Created by Hesham Salman on 5/29/17.
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
import Gloss

@testable import OctoViewer
class RepositorySpec: QuickSpec {
  override func spec() {

    describe("decoding") {
      var repository: Repository!
      var json: JSON!
      context("from notification") {
        beforeEach {
          json = parseJSONFile("Repository_Notification")
          repository = Repository(json: json)
        }

        it("Successfully parses the object from response") {
          expect(repository).toNot(beNil())
        }

      }

      it("returns nil on garbage values") {
        json = ["hello": "it's me"]
        repository = Repository(json: json)
        expect(repository).to(beNil())
      }
    }

  }
}
