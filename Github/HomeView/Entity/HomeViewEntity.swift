//
//  HomeViewEntity.swift
//  Github
//
//  Created by Karthick R on 4/11/21.
//

import Foundation

struct HomeViewDisplayEntity {
    let author: String?
    let commitHash: String?
    let commitMessage: String?
}

// MARK: - HomeViewEntity
struct HomeViewEntity: Codable {
    let sha, nodeID: String?
    let commit: Commit?
    let url, htmlURL, commentsURL: String?
    let author, committer: WelcomeAuthor?
    let parents: [Parent]?

    enum CodingKeys: String, CodingKey {
        case sha
        case nodeID = "node_id"
        case commit, url
        case htmlURL = "html_url"
        case commentsURL = "comments_url"
        case author, committer, parents
    }
}

// MARK: - WelcomeAuthor
struct WelcomeAuthor: Codable {
    let login: Login?
    let id: Int?
    let nodeID: NodeID?
    let avatarURL: String?
    let gravatarID: String?
    let url, htmlURL, followersURL: String?
    let followingURL: FollowingURL?
    let gistsURL: GistsURL?
    let starredURL: StarredURL?
    let subscriptionsURL, organizationsURL, reposURL: String?
    let eventsURL: EventsURL?
    let receivedEventsURL: String?
    let type: TypeEnum?
    let siteAdmin: Bool?

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }
}

enum EventsURL: String, Codable {
    case httpsAPIGithubCOMUsersEckarthi511EventsPrivacy = "https://api.github.com/users/eckarthi511/events{/privacy}"
    case httpsAPIGithubCOMUsersWebFlowEventsPrivacy = "https://api.github.com/users/web-flow/events{/privacy}"
}

enum FollowingURL: String, Codable {
    case httpsAPIGithubCOMUsersEckarthi511FollowingOtherUser = "https://api.github.com/users/eckarthi511/following{/other_user}"
    case httpsAPIGithubCOMUsersWebFlowFollowingOtherUser = "https://api.github.com/users/web-flow/following{/other_user}"
}

enum GistsURL: String, Codable {
    case httpsAPIGithubCOMUsersEckarthi511GistsGistID = "https://api.github.com/users/eckarthi511/gists{/gist_id}"
    case httpsAPIGithubCOMUsersWebFlowGistsGistID = "https://api.github.com/users/web-flow/gists{/gist_id}"
}

enum Login: String, Codable {
    case eckarthi511 = "eckarthi511"
    case webFlow = "web-flow"
}

enum NodeID: String, Codable {
    case mdq6VXNlcjE5ODY0NDQ3 = "MDQ6VXNlcjE5ODY0NDQ3"
    case mdq6VXNlcjgyMjQ0MjIz = "MDQ6VXNlcjgyMjQ0MjIz"
}

enum StarredURL: String, Codable {
    case httpsAPIGithubCOMUsersEckarthi511StarredOwnerRepo = "https://api.github.com/users/eckarthi511/starred{/owner}{/repo}"
    case httpsAPIGithubCOMUsersWebFlowStarredOwnerRepo = "https://api.github.com/users/web-flow/starred{/owner}{/repo}"
}

enum TypeEnum: String, Codable {
    case user = "User"
}

// MARK: - Commit
struct Commit: Codable {
    let author, committer: CommitAuthor?
    let message: String?
    let tree: Tree?
    let url: String?
    let commentCount: Int?
    let verification: Verification?

    enum CodingKeys: String, CodingKey {
        case author, committer, message, tree, url
        case commentCount = "comment_count"
        case verification
    }
}

// MARK: - CommitAuthor
struct CommitAuthor: Codable {
    let name: Name?
    let email: Email?
    let date: String?
}

enum Email: String, Codable {
    case eckarthi511GmailCOM = "eckarthi511@gmail.com"
    case noreplyGithubCOM = "noreply@github.com"
    case the82244223Eckarthi511UsersNoreplyGithubCOM = "82244223+eckarthi511@users.noreply.github.com"
}

enum Name: String, Codable {
    case eckarthi511 = "eckarthi511"
    case gitHub = "GitHub"
    case karthickR = "Karthick R"
}

// MARK: - Tree
struct Tree: Codable {
    let sha: String?
    let url: String?
}

// MARK: - Verification
struct Verification: Codable {
    let verified: Bool?
    let reason: String?
    let signature, payload: String?
}

// MARK: - Parent
struct Parent: Codable {
    let sha: String?
    let url, htmlURL: String?

    enum CodingKeys: String, CodingKey {
        case sha, url
        case htmlURL = "html_url"
    }
}


