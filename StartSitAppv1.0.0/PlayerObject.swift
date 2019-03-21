//
//  PlayerObject.swift
//  StartSitAppv1.0.0
//
//  Created by Juan Manuel Jimenez Ramos on 3/19/19.
//  Copyright © 2019 Juan Manuel Jimenez Ramos. All rights reserved.
//

import Foundation
import FirebaseDatabase

class PlayerObject : NSObject
{
    var PlayerID :Int
    var Name : String
    var Team : String
    var Position : String
    var LastSeasonFantasyPoints : Double
    let ref : DatabaseReference?
    
    init(PlayerID: Int, Name : String, Team : String, Position : String, LastSeasonFantasyPoints : Double) {
        self.PlayerID = PlayerID
        self.Name = Name
        self.Team = Team
        self.Position = Position
        self.LastSeasonFantasyPoints = LastSeasonFantasyPoints
        
        ref = nil
        
        super.init()
    }
    
    init(key: String, snapshot: DataSnapshot) {
        Name = key
        
        let snapvalues = snapshot.value as! [String : AnyObject]
        let snapDictionary = snapvalues[key] as! [String:AnyObject]
        
        PlayerID = snapDictionary["PlayerID"] as? Int ?? 0
        Team = snapDictionary["Team"] as? String ?? "N/A"
        Position = snapDictionary["Position"] as? String ?? "N/A"
        LastSeasonFantasyPoints = snapDictionary["LastSeasonFantasyPoints"] as? Double ?? -120.662065
        
        ref = snapshot.ref
        
        super.init()
    }
    
    
}
