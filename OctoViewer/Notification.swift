//
//  Notification.swift
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

struct GitNotification {
  let id: String
  let repository: Repository
  let subject: NotificationSubject
  let reason: NotificationReason
  let unread: Bool
  let updatedAt: Date
  let lastReadAt: Date?
  let url: URL
}

extension GitNotification: Decodable {
  init?(json: JSON) {
    guard let id: String = Keys.id <~~ json,
      let repository: Repository = Keys.repository <~~ json,
      let subject: NotificationSubject = Keys.subject <~~ json,
      let reason: NotificationReason = Keys.reason <~~ json,
      let unread: Bool = Keys.unread <~~ json,
      let updatedAt: Date = Decoder.decode(dateISO8601ForKey: Keys.updatedAt)(json),
      let url: URL = Keys.url <~~ json else {
        return nil
    }
    self.id = id
    self.repository = repository
    self.subject = subject
    self.reason = reason
    self.unread = unread
    self.url = url
    self.updatedAt = updatedAt
    self.lastReadAt = Decoder.decode(dateISO8601ForKey: Keys.lastReadAt)(json)
  }
}

private struct Keys {
  static let id = "id"
  static let repository = "repository"
  static let subject = "subject"
  static let reason = "reason"
  static let unread = "unread"
  static let updatedAt = "updated_at"
  static let lastReadAt = "last_read_at"
  static let url = "url"
}
