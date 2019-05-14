//
//  HomePageViewController.swift
//  StartSitAppv1.0.0
//
//  Created by Juan Manuel Jimenez Ramos on 3/3/19.
//  Copyright © 2019 Juan Manuel Jimenez Ramos. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let apiURL = "https://api.fantasydata.net/v3/nfl/stats/JSON/FantasyPlayers?key=c36dbc38cb9945d1a693e3165727c64c"
    
    var RankedPlayer : [PlayerRankModel]?
    
    
    @IBOutlet weak var tableview: UITableView!
    var players:[String] = [];
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let request = URLRequest(url: URL(string: apiURL)!)
        
        let task: URLSessionDataTask = session.dataTask(with: request)
        { (receivedData, response, error) -> Void in
            
            if let data = receivedData {
                do {
                    let decoder = JSONDecoder()
                    let player = try decoder.decode([PlayerRankModel].self, from: data)
                    
                    self.RankedPlayer = player
                    
                    DispatchQueue.main.async {
                        self.tableview.reloadData()
                    }
                    
                } catch {
                    print("Exception on Decode: \(error)")
                }
            }
        }
        task.resume()
        
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as? RankedPlayerViewCell
        
        let playerToday = RankedPlayer?[indexPath.row]
        
        cell?.nameLabel?.text = playerToday?.Name
        cell?.nameLabel?.font = UIFont(name: "Future-MediumItalic", size: 30)
        cell?.teamLabel?.text = playerToday?.Team
        cell?.posLabel?.text = playerToday?.Position
        let points:String = String(format:"%f", playerToday?.LastSeasonFantasyPoints ?? 0)
        let playerID:String = String(format:"%d", playerToday?.PlayerID ?? 0)
        //let playerID = "\(String(describing: playerToday?.PlayerID))"
        
        cell?.pointsLabel?.text = points
        //cell
        //print(playerID)
        //print("THATS THE PLAYER ID")
        //let urlForImage = "https://s3-us-west-2.amazonaws.com/static.fantasydata.com/headshots/nfl/low-res/127.png"
        var urlForImage = "https://s3-us-west-2.amazonaws.com/static.fantasydata.com/headshots/nfl/low-res/" + playerID + ".png"
        //print(newurlForImage)
        //print("THIS IS NEW URL")
        
        var urlForTeamImage = "http://content.sportslogos.net/logos/7/177/full/kwth8f1cfa2sch5xhjjfaof90.png"
        
        
        switch playerToday?.Team {
        //case 150:
            //print("Number is 150")
        case "ARI": //Arizona Cardinals
            urlForTeamImage = "http://content.sportslogos.net/logos/7/177/full/kwth8f1cfa2sch5xhjjfaof90.png"
        case "ATL": //Atlanta Falcons
            urlForTeamImage = "http://content.sportslogos.net/logos/7/173/full/299.png"
        case "BAL": //Baltimore Ravens
            urlForTeamImage = "http://content.sportslogos.net/logos/7/153/full/318.png"
        case "BUF": //Buffalo Bills
            urlForTeamImage = "http://content.sportslogos.net/logos/7/149/full/n0fd1z6xmhigb0eej3323ebwq.png"
        case "CAR": //Carolina Panthers
            urlForTeamImage = "http://content.sportslogos.net/logos/7/174/full/f1wggq2k8ql88fe33jzhw641u.png"
        case "CHI": //Chicago Bears
            urlForTeamImage = "http://content.sportslogos.net/logos/7/169/full/364.png"
        case "CIN": //Cincinnati Bengals
            urlForTeamImage = "http://content.sportslogos.net/logos/7/154/full/403.png"
        case "CLE": //Cleveland Browns
            urlForTeamImage = "http://content.sportslogos.net/logos/7/155/full/7855_cleveland_browns-primary-2015.png"
        case "DAL": //Dallas Cowboys
            urlForTeamImage = "http://content.sportslogos.net/logos/7/165/full/406.png"
        case "DEN": //Denver Broncos
            urlForTeamImage = "http://content.sportslogos.net/logos/7/161/full/9ebzja2zfeigaziee8y605aqp.png"
        case "DET": //Detroit Lions
            urlForTeamImage = "http://content.sportslogos.net/logos/7/170/full/1398_detroit_lions-primary-2017.png"
        case "GB": //Green Bay Packers
            urlForTeamImage = "http://content.sportslogos.net/logos/7/171/full/dcy03myfhffbki5d7il3.png"
        case "HOU": //Houston Texans
            urlForTeamImage = "http://content.sportslogos.net/logos/7/157/full/570.png"
        case "IND": //Indianapolis Colts
            urlForTeamImage = "http://content.sportslogos.net/logos/7/158/full/593.png"
        case "JAX": //Jacksonville Jaguars
            urlForTeamImage = "http://content.sportslogos.net/logos/7/159/full/8856_jacksonville_jaguars-alternate-2013.png"
        case "KC": //Kansas City Chiefs
            urlForTeamImage = "http://content.sportslogos.net/logos/7/162/full/857.png"
        case "MIA": //Miami Dolphins
            urlForTeamImage = "http://content.sportslogos.net/logos/7/150/full/7306_miami_dolphins-primary-2018.png"
        case "MIN": //Minnesota Vikings
            urlForTeamImage = "http://content.sportslogos.net/logos/7/172/full/2704_minnesota_vikings-primary-2013.png"
        case "NE": //New England Patriots
            urlForTeamImage = "http://content.sportslogos.net/logos/7/151/full/y71myf8mlwlk8lbgagh3fd5e0.png"
        case "NO": //New Orleans Saints
            urlForTeamImage = "http://content.sportslogos.net/logos/7/175/full/907.png"
        case "NYG": //New York Giants
            urlForTeamImage = "http://content.sportslogos.net/logos/7/166/full/919.gif"
        case "NYJ": //New York Jets
            urlForTeamImage = "http://content.sportslogos.net/logos/7/152/full/v7tehkwthrwefgounvi7znf5k.png"
        case "OAK": //Oakland Raiders
            urlForTeamImage = "http://content.sportslogos.net/logos/7/163/full/g9mgk6x3ge26t44cccm9oq1vl.png"
        case "PHI": //Philadelphia Eagles
            urlForTeamImage = "http://content.sportslogos.net/logos/7/167/full/960.png"
        case "PIT": //Pittsburgh Steelers
            urlForTeamImage = "http://content.sportslogos.net/logos/7/156/full/970.png"
        case "LAC": //San Diego Chargers
            urlForTeamImage = "http://content.sportslogos.net/logos/7/6446/full/2415_los_angeles__chargers-primary-2017.png"
        case "SEA": //Seattle Seahawks
            urlForTeamImage = "http://content.sportslogos.net/logos/7/180/full/pfiobtreaq7j0pzvadktsc6jv.png"
        case "SF": //San Francisco 49ers
            urlForTeamImage = "http://content.sportslogos.net/logos/7/179/full/9455_san_francisco_49ers-primary-2009.png"
        case "LAR": //Saint Louis Rams
            urlForTeamImage = "http://content.sportslogos.net/logos/7/5941/full/7953_los_angeles_rams-primary-2017.png"
        case "TB": //Tampa Bay Buccaneers
            urlForTeamImage = "http://content.sportslogos.net/logos/7/176/full/3670_tampa_bay_buccaneers-primary-2014.png"
        case "TEN"://Tennessee Titans
            urlForTeamImage = "http://content.sportslogos.net/logos/7/160/full/1053.png"
        case "WAS": //Washington Redskins
            urlForTeamImage = "http://content.sportslogos.net/logos/7/168/full/im5xz2q9bjbg44xep08bf5czq.png"
        default:
            urlForTeamImage = "http://content.sportslogos.net/logos/7/1007/full/1745__national_football_league-primary-1930.png"
        }
        
        if (try? Data(contentsOf: URL(string: urlForImage)!)) == nil
        {
            urlForImage = "https://www.statefansnation.com/wp-content/uploads/2017/01/d-fence-defense-sign.jpg"
            print(urlForImage)
        }
        
        /*if (try? Data(contentsOf: URL(string: urlForTeamImage)!)) == nil
        {
            urlForTeamImage = "http://content.sportslogos.net/logos/7/1007/full/1745__national_football_league-primary-1930.png"
            print(urlForImage)
        }*/
        
        DispatchQueue.global(qos: .userInitiated).async {
            
            let url = URL(string: urlForImage)
            let responseData = try? Data(contentsOf: url!)
            let downloadedImage = UIImage(data: responseData!)
            
            //print("hello")
            
            DispatchQueue.main.async {
                cell?.playerImageView?.image = downloadedImage
            }
            
        }
        DispatchQueue.global(qos: .userInitiated).async {
            
            let url = URL(string: urlForTeamImage)
            let responseData = try? Data(contentsOf: url!)
            let downloadedImage = UIImage(data: responseData!)
            
            //print("hello")
            
            DispatchQueue.main.async {
                cell?.teamImageView?.image = downloadedImage
            }
            
        }
        return cell!
    }
    
    @IBAction func unwindFromDetail(segue:UIStoryboardSegue) {
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showPlayerInfo" {
            let destVC = segue.destination as? PlayerDetailsViewController
            let selectedIndexPath = tableview.indexPathForSelectedRow
            destVC?.allplayers = RankedPlayer
            destVC?.index = selectedIndexPath?.row
        
        }
        else if segue.identifier == "comparePlayers"
        {
            let destVC = segue.destination as? StartSitViewController
            destVC?.allplayers = RankedPlayer
        }
    }
 

}
