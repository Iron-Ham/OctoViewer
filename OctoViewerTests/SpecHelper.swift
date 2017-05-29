//
//  SpecHelper.swift
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
import Gloss

@testable import OctoViewer
func parseJSONFile<T>(_ path: String) -> T {
  let bundlePath = Bundle(for: LaunchViewControllerSpec.self).path(forResource: path, ofType: "json")!
  var parsedFile: T? = nil
  do {
    let jsonData = try Data(contentsOf: URL(fileURLWithPath: bundlePath), options: .mappedIfSafe)

    if let jsonResult = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as Any? {
      parsedFile = jsonResult as? T
    } else {
      assert(false, "Could not seralize local json")
    }
  } catch {
    assert(false, "Error Could not read json")
  }

  return parsedFile!
}
