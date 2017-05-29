//
//  NotificationSubjectSpec.swift
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
class NotificationSubjectSpec: QuickSpec {
  override func spec() {

    describe("Decoding") {
      var json: JSON!

      beforeEach {
        json = parseJSONFile("NotificationSubject")
      }

      it("Can parse the json successfully") {
        let subject = NotificationSubject(json: json)
        expect(subject).toNot(beNil())
      }

      it("returns nil on arbitrary json") {
        let subject = NotificationSubject(json: ["hello": "darkness my old friend"])
        expect(subject).to(beNil())
      }
    }

  }
}
