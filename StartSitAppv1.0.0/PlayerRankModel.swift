//
//  PlayerRankModel.swift
//  StartSitAppv1.0.0
//
//  Created by Juan Manuel Jimenez Ramos on 3/4/19.
//  Copyright © 2019 Juan Manuel Jimenez Ramos. All rights reserved.
//

import Foundation

struct PlayerRankModel : Codable
{
    var PlayerID :Int?
    var Name : String?
    var Team : String?
    var Position : String?
    var LastSeasonFantasyPoints : Double?
    
    init() {
        PlayerID = 0
        Name = "N/A"
        Team = "N/A"
        Position = "N/A"
        LastSeasonFantasyPoints = 0.0
    }
    
    func toAnyObject() -> Any {
        return [
            "PlayerID" : PlayerID ?? 0,
            "Name" : Name!,
            "Team" : Team!,
            "Position" : Position!,
            "LastSeasonFantasyPoints" : LastSeasonFantasyPoints ?? 0.0
            /*"name" : name!,
            "city" : city ?? "N/A",
            "state" : state ?? "N/A",
            "zip" : zip ?? "N/A",
            "email" : email ?? "N/A",
            "latitude" : latitude ?? 0.0,
            "longitude" : longitude ?? 0.0*/
        ]
    }
}
