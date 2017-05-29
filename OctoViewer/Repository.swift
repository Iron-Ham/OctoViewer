//
//  Repository.swift
//  OctoViewer
//
//  Created by Hesham Salman on 5/29/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
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

struct Repository {
  let id: Int
  let owner: RepositoryOwner
  let name: String
  let fullName: String
  let description: String
  let isPrivate: Bool
  let isFork: Bool
  let url: URL
  let htmlUrl: URL
}

extension Repository: Decodable {
  init?(json: JSON) {
    guard let id: Int = Keys.id <~~ json,
      let name: String = Keys.name <~~ json,
      let owner: RepositoryOwner = Keys.owner <~~ json,
      let fullName: String = Keys.fullName <~~ json,
      let description: String = Keys.description <~~ json,
      let isPrivate: Bool = Keys.private <~~ json,
      let isFork: Bool = Keys.fork <~~ json,
      let url: URL = Keys.url <~~ json,
      let htmlUrl: URL = Keys.htmlUrl <~~ json else {
        return nil
    }

    self.id = id
    self.name = name
    self.fullName = fullName
    self.description = description
    self.isPrivate = isPrivate
    self.url = url
    self.htmlUrl = htmlUrl
    self.owner = owner
    self.isFork = isFork
  }
}

private struct Keys {
  static let id = "id"
  static let owner = "owner"
  static let name = "name"
  static let fullName = "full_name"
  static let description = "description"
  static let `private` = "private"
  static let fork = "fork"
  static let url = "url"
  static let htmlUrl = "html_url"
  static let archiveUrl = "archive_url"
  static let assigneesUrl = "assignees_url"
  static let blobsUrl = "blobs_url"
  static let branchesUrl = "branches_url"
  static let cloneUrl = "clone_url"
  static let collaboratorsUrl = "collaborators_url"
  static let commentsUrl = "comments_url"
  static let commitsUrl = "commits_url"
  static let compareUrl = "compare_url"
  static let contentsUrl = "contents_url"
  static let contributorsUrl = "contributors_url"
  static let deploymentsUrl = "deployments_url"
  static let downloadsUrl = "downloads_url"
  static let eventsUrl = "events_url"
  static let forksUrl = "forks_url"
  static let gitCommitsUrl = "git_commits_url"
  static let gitRefsUrl = "git_refs_url"
  static let gitTagsUrl = "git_tags_urls"
  static let gitUrl = "git_url"
  static let hooksUrl = "hooks_url"
  static let issueCommentUrl = "issue_comment_url"
  static let issueEventsUrl = "issue_events_url"
  static let issuesUrl = "issues_url"
  static let keysUrl = "keys_url"
  static let labelsUrl = "labels_url"
  static let languagesUrl = "languages_url"
  static let sshUrl = "ssh_url"
  static let stargazersUrl = "stargazers_url"
  static let statusesUrl = "statuses_url"
  static let subscribersUrl = "subscribers_url"
  static let subscriptionUrl = "subscription_url"
  static let svnUrl = "svn_url"
  static let tagsUrl = "tags_url"
  static let teamsUrl = "teams_url"
  static let treesUrl = "trees_url"
  static let homepage = "homepage"
  static let language = "language"
  static let forksCount = "forks_count"
  static let stargazersCount = "stargazers_count"
  static let watchersCount = "watchers_count"
  static let size = "size"
  static let defaultBranch = "default_branch"
  static let openIssuesCount = "open_issues_count"
  static let topics = "topics"
  static let hasIssues = "has_issues"
  static let hasWiki = "has_wiki"
  static let hasPages = "has_pages"
  static let hasDownloads = "has_downloads"
  static let pushedAt = "pushed_at"
  static let createdAt = "created_at"
  static let updatedAt = "updated_at"
  static let permissions = "permissions"
  static let allowRebaseMerge = "allow_rebase_merge"
  static let allowSquashMerge = "allow_squash_merge"
  static let allowMergeCommit = "allow_merge_commit"
  static let subscribersCount = "subscribers_count"
  static let networkCount = "network_count"
  static let organization = "organization"
  static let parent = "parent"
}
