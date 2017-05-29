//
//  User.swift
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

typealias RepositoryOwner = User

struct User {
  let login: String
  let id: Int
  let avatarUrl: URL
  let gravatarId: String
  let url: URL
  let followersUrl: URL
  let followingUrl: URL
  let gistsUrl: URL
  let starredUrl: URL
  let subscriptionsUrl: URL?
  let organizationsUrl: URL?
  let reposUrl: URL
  let eventsUrl: URL
  let receivedEventsUrl: URL
  let type: String
  let siteAdmin: Bool
  let name: String?
  let company: String?
  let blogUrl: URL?
  let location: String?
  let email: String?
  let hireable: Bool?
  let bio: String
  let publicRepos: Int?
  let publicGists: Int?
  let followers: Int?
  let following: Int?
  let createdAt: Date?
  let updatedAt: Date?
}

//swiftlint:disable function_body_length
extension User: Glossy {
  init?(json: JSON) {
    guard let login: String = Keys.login <~~ json,
      let id: Int = Keys.id <~~ json,
      let avatarUrl: URL = Keys.avatarUrl <~~ json,
      let gravatarId: String = Keys.gravatarId <~~ json,
      let url: URL = Keys.url <~~ json,
      let followersUrl: URL = Keys.followersUrl <~~ json,
      let followingUrl: URL = Keys.followingUrl <~~ json,
      let gistsUrl: URL = Keys.gistsUrl <~~ json,
      let starredUrl: URL = Keys.starredUrl <~~ json,
      let reposUrl: URL = Keys.reposUrl <~~ json,
      let eventsUrl: URL = Keys.eventsUrl <~~ json,
      let receivedEventsUrl: URL = Keys.receivedEventsUrl <~~ json,
      let type: String = Keys.type <~~ json,
      let siteAdmin: Bool = Keys.siteAdmin <~~ json,
      let bio: String = Keys.bio <~~ json else {
        return nil
    }
    self.login = login
    self.id = id
    self.avatarUrl = avatarUrl
    self.gravatarId = gravatarId
    self.url = url
    self.followersUrl = followersUrl
    self.followingUrl = followingUrl
    self.gistsUrl = gistsUrl
    self.starredUrl = starredUrl
    self.reposUrl = reposUrl
    self.eventsUrl = eventsUrl
    self.receivedEventsUrl = receivedEventsUrl
    self.type = type
    self.siteAdmin = siteAdmin
    self.bio = bio
    self.subscriptionsUrl = Keys.subscriptionsUrl <~~ json
    self.organizationsUrl = Keys.organizationsUrl <~~ json
    self.name = Keys.name <~~ json
    self.company = Keys.company <~~ json
    self.blogUrl = Keys.blog <~~ json
    self.location = Keys.location <~~ json
    self.email = Keys.email <~~ json
    self.hireable = Keys.hireable <~~ json
    self.publicRepos = Keys.publicRepos <~~ json
    self.publicGists = Keys.publicGists <~~ json
    self.followers = Keys.followers <~~ json
    self.following = Keys.following <~~ json
    self.createdAt = Keys.createdAt <~~ json
    self.updatedAt = Keys.updatedAt <~~ json
  }

  func toJSON() -> JSON? {
    return jsonify([
      Keys.name ~~> self.name,
      Keys.company ~~> self.company,
      Keys.blog ~~> self.blogUrl,
      Keys.location ~~> self.location,
      Keys.email ~~> self.email,
      Keys.hireable ~~> self.hireable,
      Keys.bio ~~> self.bio
      ])
  }
}

private struct Keys {
  static let login = "login"
  static let id = "id"
  static let avatarUrl = "avatar_url"
  static let gravatarId = "gravatar_id"
  static let url = "url"
  static let htmlUrl = "html_url"
  static let followersUrl = "followers_url"
  static let followingUrl = "following_url"
  static let gistsUrl = "gists_url"
  static let starredUrl = "starred_url"
  static let subscriptionsUrl = "subscriptions_url"
  static let organizationsUrl = "organizations_url"
  static let reposUrl = "repos_url"
  static let eventsUrl = "events_url"
  static let receivedEventsUrl = "received_events_url"
  static let type = "type"
  static let siteAdmin = "site_admin"
  static let name = "name"
  static let company = "company"
  static let blog = "blog"
  static let location = "location"
  static let email = "email"
  static let hireable = "hireable"
  static let bio = "bio"
  static let publicRepos = "public_repos"
  static let publicGists = "public_gists"
  static let followers = "followers"
  static let following = "following"
  static let createdAt = "created_at"
  static let updatedAt = "updated_at"
}
