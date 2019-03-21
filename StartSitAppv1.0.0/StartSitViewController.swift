//
//  StartSitViewController.swift
//  StartSitAppv1.0.0
//
//  Created by Juan Manuel Jimenez Ramos on 3/3/19.
//  Copyright © 2019 Juan Manuel Jimenez Ramos. All rights reserved.
//

import UIKit

class StartSitViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var firstPlayerImageView: UIImageView!
    @IBOutlet weak var secondPlayerImageView: UIImageView!
    
    @IBOutlet weak var firstPlayerTextField: UITextField!
    @IBOutlet weak var secondPlayerTextField: UITextField!
    
    @IBOutlet weak var searchfirstPlayerTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var firstPlayerName: UILabel!
    @IBOutlet weak var secondPlayerName: UILabel!
    
    
    var searchActive : Bool = false
    var playerOneSet : Bool = false
    var playerTwoSet : Bool = false
    
    var allplayers : [PlayerRankModel]?
    var filteredplayers:[PlayerRankModel] = []
    
    var firstPlayerId : Int?
    var secondPlayerId : Int?
    
    //let searchController = UISearchController(searchResultsController: nil)

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchfirstPlayerTableView.delegate = self
        searchfirstPlayerTableView.dataSource = self
        searchBar.delegate = self
            
        searchBar.placeholder = "Search Players"
        
        //searchController.searchResultsUpdater = self
        //searchController.obscuresBackgroundDuringPresentation = false
        //searchController.searchBar.placeholder = "Search Candies"
        //searchfirstPlayerTableView.tableHeaderView = searchController.searchBar
        //self.searchController.hidesNavigationBarDuringPresentation = false
        //searchController.searchBar.delegate = self
        //print(firstPlayerId)
        //print("ID^^")
        DispatchQueue.global(qos: .userInitiated).async {
            
           // print(self.firstPlayerId)
            //print("ID^^")
            
            //temporarily setting url to nfl logo
            let url = URL(string: "https://americanfootballfilms.com/wp-content/uploads/2012/11/nfl-logo.jpg")
            let responseData = try? Data(contentsOf: url!)
            let downloadedImage = UIImage(data: responseData!)
        
            //print("downloaded image")
        
            DispatchQueue.main.async {
                self.firstPlayerImageView.image = downloadedImage
                self.secondPlayerImageView.image = downloadedImage
            }
            
        }

        // Do any additional setup after loading the view.
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredplayers = allplayers!.filter({ (PlayerRankModel) -> Bool in
            let tmp: NSString = PlayerRankModel.Name! as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if(filteredplayers.count == 0){
            searchActive = false;
            print("NOT ACTIVE");
        } else {
            print("Ready");
            searchActive = true;
        }
        self.searchfirstPlayerTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*if searchBar.text?.count ?? 0 > 0
        {
            searchActive = true
        }*/
        if (searchActive == true)
        {
            if (playerOneSet)
            {
                secondPlayerName.text = filteredplayers[indexPath.row].Name
                secondPlayerId = filteredplayers[indexPath.row].PlayerID!
                playerOneSet = false
                let playerID:String = String(format:"%d", self.secondPlayerId!)
                var urlForImage = "https://s3-us-west-2.amazonaws.com/static.fantasydata.com/headshots/nfl/low-res/" + playerID + ".png"
                if (try? Data(contentsOf: URL(string: urlForImage)!)) == nil
                {
                    urlForImage = "https://www.statefansnation.com/wp-content/uploads/2017/01/d-fence-defense-sign.jpg"
                }
                let url = URL(string: urlForImage)
                let responseData = try? Data(contentsOf: url!)
                let downloadedImage = UIImage(data: responseData!)
                
                //print("downloaded image")
                //self.firstPlayerImageView.image = downloadedImage
                self.secondPlayerImageView.image = downloadedImage
            }
            else
            {
                firstPlayerName.text = filteredplayers[indexPath.row].Name
                firstPlayerId = filteredplayers[indexPath.row].PlayerID!
                //print(firstPlayerId)
                //print("DID I CHANGE")
                playerOneSet = true
                let playerID:String = String(format:"%d", self.firstPlayerId!)
                var urlForImage = "https://s3-us-west-2.amazonaws.com/static.fantasydata.com/headshots/nfl/low-res/" + playerID + ".png"
                if (try? Data(contentsOf: URL(string: urlForImage)!)) == nil
                {
                    urlForImage = "https://www.statefansnation.com/wp-content/uploads/2017/01/d-fence-defense-sign.jpg"
                }
                let url = URL(string: urlForImage)
                let responseData = try? Data(contentsOf: url!)
                let downloadedImage = UIImage(data: responseData!)
                
                //print("downloaded image")
                self.firstPlayerImageView.image = downloadedImage
                //self.secondPlayerImageView.image = downloadedImage
            }
        }
        else
        {
            if (playerOneSet)
            {
                secondPlayerName.text = allplayers![indexPath.row].Name
                secondPlayerId = allplayers![indexPath.row].PlayerID!
                playerOneSet = false
                let playerID:String = String(format:"%d", self.secondPlayerId!)
                var urlForImage = "https://s3-us-west-2.amazonaws.com/static.fantasydata.com/headshots/nfl/low-res/" + playerID + ".png"
                if (try? Data(contentsOf: URL(string: urlForImage)!)) == nil
                {
                    urlForImage = "https://www.statefansnation.com/wp-content/uploads/2017/01/d-fence-defense-sign.jpg"
                }
                let url = URL(string: urlForImage)
                let responseData = try? Data(contentsOf: url!)
                let downloadedImage = UIImage(data: responseData!)
                
                //print("downloaded image")
                //self.firstPlayerImageView.image = downloadedImage
                self.secondPlayerImageView.image = downloadedImage
            }
            else
            {
                firstPlayerName.text = allplayers![indexPath.row].Name
                firstPlayerId = allplayers![indexPath.row].PlayerID!
                //print(firstPlayerId)
                //print("DID I CHANGE")
                playerOneSet = true
                let playerID:String = String(format:"%d", self.firstPlayerId!)
                var urlForImage = "https://s3-us-west-2.amazonaws.com/static.fantasydata.com/headshots/nfl/low-res/" + playerID + ".png"
                if (try? Data(contentsOf: URL(string: urlForImage)!)) == nil
                {
                    urlForImage = "https://www.statefansnation.com/wp-content/uploads/2017/01/d-fence-defense-sign.jpg"
                }
                let url = URL(string: urlForImage)
                let responseData = try? Data(contentsOf: url!)
                let downloadedImage = UIImage(data: responseData!)
                
                print("downloaded image")
                self.firstPlayerImageView.image = downloadedImage
                //self.secondPlayerImageView.image = downloadedImage
            }
        }
    }
    
    @IBAction func unwindFromCompare(segue:UIStoryboardSegue) {
        searchActive = true
        if filteredplayers.count == 0
        {
            searchActive = false
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filteredplayers.count
        }
        return allplayers!.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "firstSearchCell", for: indexPath) as? SearchViewCell
        
        if(searchActive){
            if indexPath.row >= filteredplayers.count
            {
                print("fixed")
                searchActive = false
                let playerToday = allplayers?[indexPath.row]
                cell?.nameLabel?.text = playerToday?.Name
                cell?.teamLabel?.text = playerToday?.Team
                cell?.posLabel?.text = playerToday?.Position
            }
            else
            {
                print("fixedonfilter")
                let playerToday = filteredplayers[indexPath.row]
                cell?.nameLabel?.text = playerToday.Name
                cell?.teamLabel?.text = playerToday.Team
                cell?.posLabel?.text = playerToday.Position
            }
        } else {
            let playerToday = allplayers?[indexPath.row]
            cell?.nameLabel?.text = playerToday?.Name
            cell?.teamLabel?.text = playerToday?.Team
            cell?.posLabel?.text = playerToday?.Position
        }
       
        return cell!
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showWinner" {
            let destVC = segue.destination as? SelectedPlayerViewController
            //let selectedIndexPath = searchfirstPlayerTableView.indexPathForSelectedRow
            //self.playerOneSet = false
            //print(self.firstPlayerId!)
            //print(self.secondPlayerId!)
            destVC?.firstID = self.firstPlayerId!
            destVC?.secondID = self.secondPlayerId!
            destVC?.firstName = firstPlayerName.text
            destVC?.secondName = secondPlayerName.text
            //destVC?.allplayers = RankedPlayer
            //destVC?.index = selectedIndexPath?.row
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
