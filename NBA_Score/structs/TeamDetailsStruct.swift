//
//  test.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 08-01-19.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//
//  Team struct, indexes the player, and calculates team ratings.


import UIKit

struct teamDetails2: Codable {
    var _internal: InternalTest
    var league: Standard
}

struct InternalTest: Codable {
    var pubDateTime: String
    var xslt: String
    var eventName: String
}

struct Standard: Codable {
    var standard: [Team]}

struct Team: Codable {
    var isNBAFranchise: Bool
    var isAllStar: Bool
    var city: String
    var altCityName: String
    var fullName: String
    var tricode: String
    var teamId: String
    var nickname: String
    var urlName: String
    var confName: String
    var divName: String
    var players: [Player]?
    
    /// indexes the player
    func playerIndexWith(id: String) -> Int {
        for (num, player) in players!.enumerated() {
            if player.personId == id {
                return num
            }
        }
        return 0
    }
    
    /// calculates the offensive rating of a team
    var offensiveRating: Int {
        var totalOffense = 0
        for player in players! {
            if player.stats != nil {
                totalOffense += player.stats!.offensiveRatingWeighted
            }
        }
        return totalOffense
    }
    
    /// calculates the defensive rating of a team
    var defensiveRating: Int {
        var totalDefensive = 0
        for player in players! {
            if player.stats != nil {
                totalDefensive += player.stats!.defensiveRatingWeighted
            }
        }
        return totalDefensive
    }
    
    /// calculates the overal rating of a team
    var overalRating: Int {
        var total = 0
        for player in players! {
            if player.stats != nil {
                total += player.stats!.overallRatingWeighted
            }
            
        }
        return total
    }
}
