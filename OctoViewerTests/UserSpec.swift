//
//  UserSpec.swift
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
class UserSpec: QuickSpec {
  override func spec() {

    describe("Decoding") {
      var json: JSON!

      beforeEach {
        json = parseJSONFile("AuthenticatedUser")
      }

      it("Can parse the user json successfully") {
        let user = User(json: json)
        expect(user).toNot(beNil())
      }

      it("returns nil on arbitrary json") {
        let user = User(json: ["Hello": "WORLD"])
        expect(user).to(beNil())
      }
    }

    describe("Encoding") {
      var json: JSON!
      var user: User!
      var parsedJson: JSON!
      beforeEach {
        json = parseJSONFile("AuthenticatedUser")
        user = User(json: json)
        user.name = "Aku"
        user.company = "World Domination Inc."
        user.email = "TheUltimateEvil@Aku.com"
        user.hireable = false
        user.bio = "Long ago in a distant land, I, Aku, the shape-shifting Master of Darkness, unleashed an unspeakable evil! But a foolish samurai warrior wielding a magic sword stepped forth to oppose me. Before the final blow was struck, I tore open a portal in time and flung him into the future, where my evil is law! Now the fool seeks to return to the past, and undo the future that is Aku!"
        parsedJson = user.toJSON()
      }

      it("creates a json") {
        expect(parsedJson).toNot(beNil())
      }

      it("doesn't include a value for empty keys") {
        user.name = nil
        parsedJson = user.toJSON()
        expect(parsedJson["name"]).to(beNil())
      }

      it("contains the new values") {
        expect(parsedJson["name"] as? String).to(equal("Aku"))
        expect(parsedJson["company"] as? String).to(equal("World Domination Inc."))
        expect(parsedJson["email"] as? String).to(equal("TheUltimateEvil@Aku.com"))
        expect(parsedJson["hireable"] as? Bool).to(equal(false))
        expect(parsedJson["bio"] as? String).to(equal("Long ago in a distant land, I, Aku, the shape-shifting Master of Darkness, unleashed an unspeakable evil! But a foolish samurai warrior wielding a magic sword stepped forth to oppose me. Before the final blow was struck, I tore open a portal in time and flung him into the future, where my evil is law! Now the fool seeks to return to the past, and undo the future that is Aku!"))
      }

    }

  }
}
