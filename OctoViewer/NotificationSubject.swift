//
//  NotificationSubject.swift
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

struct NotificationSubject {
  let title: String
  let url: URL
  let latestCommentUrl: URL
  let type: NotificationType
}

extension NotificationSubject: Decodable {
  init?(json: JSON) {
    guard let title: String = Keys.title <~~ json,
      let url: URL = Keys.url <~~ json,
      let latestCommentUrl: URL = Keys.latestCommentUrl <~~ json,
      let type: NotificationType = Keys.type <~~ json else {
        return nil
    }
    self.title = title
    self.url = url
    self.latestCommentUrl = latestCommentUrl
    self.type = type
  }
}

private struct Keys {
  static let title = "title"
  static let url = "url"
  static let latestCommentUrl = "latest_comment_url"
  static let type = "type"
}
