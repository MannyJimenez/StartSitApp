//
//  PlayerDetailsViewController.swift
//  StartSitAppv1.0.0
//
//  Created by Juan Manuel Jimenez Ramos on 3/3/19.
//  Copyright © 2019 Juan Manuel Jimenez Ramos. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase

class PlayerDetailsViewController: UIViewController {
    @IBOutlet weak var clickedPlayerNameLabel: UILabel!
    @IBOutlet weak var clickedPlayerTeamLabel: UILabel!
    @IBOutlet weak var clickedPlayerPosLabel: UILabel!
    @IBOutlet weak var clickedPlayerImageView: UIImageView!
    @IBOutlet weak var clickedPlayerPointsLabel: UILabel!
    @IBOutlet weak var backToFavoritesButton: UIButton!
    
    
    var allplayers : [PlayerRankModel]?
    var favoritedPlayers : [PlayerObject]?
    var index : Int?
    
    @IBOutlet weak var favoritePlayerSwitchLabel: UILabel!
    @IBOutlet weak var favoritePlayerSwitch: UISwitch!
    
    var databaseRef : DatabaseReference?
    var player : PlayerRankModel?
    var playerobj : PlayerObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //clickedPlayerNameLabel.font = UIFont.init(name: "Future-MediumItalic", size: 30)
        
        if Auth.auth().currentUser == nil
        {
            favoritePlayerSwitch.isEnabled = false
            favoritePlayerSwitch.isOn = false
        }
        else
        {
            let restOfPath = Auth.auth().currentUser?.uid ?? "N/A"
            
            databaseRef = Database.database().reference(withPath: "Users/" + restOfPath)
            
            //oneTimeInit()
            
        }
        
        //let getIntoUserChild = databaseRef?.child(player?.Name ?? "N/A")
        databaseRef?.keepSynced(true)
        
        
        
        if (favoritedPlayers == nil)
        {
            
            backToFavoritesButton.isHidden = true
            favoritePlayerSwitch.isOn = false
            player = allplayers?[index!]
            
            clickedPlayerNameLabel.text = player?.Name
            clickedPlayerTeamLabel.text = player?.Team
            clickedPlayerPosLabel.text = player?.Position
            let points:String = String(format:"%f", player?.LastSeasonFantasyPoints ?? 0)
            clickedPlayerPointsLabel.text = points
            let playerID:String = String(format:"%d", player?.PlayerID ?? 0)
            
            
            
            
            var endurl = "https://s3-us-west-2.amazonaws.com/static.fantasydata.com/headshots/nfl/low-res/" + playerID + ".png"
            
            if (try? Data(contentsOf: URL(string: endurl)!)) == nil
            {
                endurl = "https://www.statefansnation.com/wp-content/uploads/2017/01/d-fence-defense-sign.jpg"
                print(endurl)
            }
            
            DispatchQueue.global(qos: .userInitiated).async {
                
                let url = URL(string: endurl)
                let responseData = try? Data(contentsOf: url!)
                let downloadedImage = UIImage(data: responseData!)
                
                //print("hello")
                
                DispatchQueue.main.async {
                    self.clickedPlayerImageView.image = downloadedImage
                }
                
            }
        }
        else
        {
            //print("YO I AM NOT NILLLL")
            backToFavoritesButton.isHidden = false
            favoritePlayerSwitch.isEnabled = false
            favoritePlayerSwitch.isOn = true
            playerobj = favoritedPlayers?[index!]
            
            clickedPlayerNameLabel.text = playerobj?.Name
            clickedPlayerTeamLabel.text = playerobj?.Team
            clickedPlayerPosLabel.text = playerobj?.Position
            let points:String = String(format:"%f", playerobj?.LastSeasonFantasyPoints ?? 0)
            clickedPlayerPointsLabel.text = points
            let playerID:String = String(format:"%d", playerobj?.PlayerID ?? 0)
            
            
            
            
            var endurl = "https://s3-us-west-2.amazonaws.com/static.fantasydata.com/headshots/nfl/low-res/" + playerID + ".png"
            
            if (try? Data(contentsOf: URL(string: endurl)!)) == nil
            {
                endurl = "https://www.statefansnation.com/wp-content/uploads/2017/01/d-fence-defense-sign.jpg"
                print(endurl)
            }
            
            DispatchQueue.global(qos: .userInitiated).async {
                
                let url = URL(string: endurl)
                let responseData = try? Data(contentsOf: url!)
                let downloadedImage = UIImage(data: responseData!)
                
                //print("hello")
                
                DispatchQueue.main.async {
                    self.clickedPlayerImageView.image = downloadedImage
                }
                
            }
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchClicked(_ sender: UISwitch) {
        let newStandRef = databaseRef?.child(player?.Name ?? "N/A")
        newStandRef?.setValue(player?.toAnyObject())
    }
    
    /*func oneTimeInit() {
        
        let restOfPath = Auth.auth().currentUser?.uid ?? "N/A"
        
        databaseRef?.queryOrdered(byChild: "Users/" + restOfPath).observe(.value, with:
            { snapshot in
                
                //var newSchools = [SchoolObject]()
                
                for item in snapshot.children {
                    //print("PLEASE")
                    //print(String((item as AnyObject).key))
                    self.favoritedPlayers!.append(PlayerObject(key: (item as AnyObject).key, snapshot: snapshot))
                }
                
                //print(self.favoritedPlayers[0].Name)
                
                
                /*for next in newSchools {
                 self.geoFire?.setLocation(CLLocation(latitude:next.latitude,longitude:next.longitude), forKey: next.name)
                 }*/
                //self.favoriteTableView.reloadData()
        })
        
        //self.favoriteTableView.reloadData()
    }*/
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
