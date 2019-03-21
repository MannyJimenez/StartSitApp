//
//  SelectedPlayerViewController.swift
//  StartSitAppv1.0.0
//
//  Created by Juan Manuel Jimenez Ramos on 3/3/19.
//  Copyright © 2019 Juan Manuel Jimenez Ramos. All rights reserved.
//

import UIKit

class SelectedPlayerViewController: UIViewController {
    
    
    
    var firstPlayer : [NeuralNetModel]?
    var secondPlayer : [NeuralNetModel]?

    @IBOutlet weak var winnerImageView: UIImageView!
    
    var firstID : Int?
    var secondID : Int?
    var firstName : String?
    var secondName : String?
    
    var winnerName : String?
    
    var winnerID : Int = 0
    
    var firstProjPoints : Double = 0
    var secondProjPoints : Double = 0
    var winnerProjPoints : Double = 0
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var projPointsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstplayerID:String = String(format:"%d", firstID!)
        let secondplayerID:String = String(format:"%d", secondID!)
        
        let firstapiURL = "http://18.191.177.118/player/" + firstplayerID
        let secondapiURL = "http://18.191.177.118/player/" + secondplayerID
        
        print(firstapiURL)
        print(secondapiURL)
        
        
        
        let semaphore = DispatchSemaphore(value: 0);
        let semaphore1 = DispatchSemaphore(value: 0);
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let request = URLRequest(url: URL(string: firstapiURL)!)
        let requesttwo = URLRequest(url: URL(string: secondapiURL)!)
        
        let task: URLSessionDataTask = session.dataTask(with: request)
        { (receivedData, response, error) -> Void in
            
            if let data = receivedData {
                do {
                    let decoder = JSONDecoder()
                    let player = try decoder.decode([NeuralNetModel].self, from: data)
                    
                    self.firstPlayer = player
                    //print(player[0].PlayerPointsProjected!)
                    self.firstProjPoints = player[0].PlayerPointsProjected!
                    //print(self.firstProjPoints)
                    
                    DispatchQueue.main.async {
                        self.firstProjPoints = player[0].PlayerPointsProjected!
                    }
                    
                } catch {
                    print("Exception on Decode: \(error)")
                }
            }
            semaphore.signal();
        }
        //task.finalize()
        task.resume()
        semaphore.wait()
        print(self.firstProjPoints)
        print("HAHAHA")
        let tasktwo: URLSessionDataTask = session.dataTask(with: requesttwo)
        { (receivedData, response, error) -> Void in
            
            if let data = receivedData {
                do {
                    let decoder = JSONDecoder()
                    let player = try decoder.decode([NeuralNetModel].self, from: data)
                    
                    self.secondPlayer = player
                    //print(player[0].PlayerPointsProjected!)
                    self.secondProjPoints = player[0].PlayerPointsProjected!
                    
                    DispatchQueue.main.async {
                        //self.tableview.reloadData()
                    }
                    
                } catch {
                    print("Exception on Decode: \(error)")
                }
            }
            semaphore1.signal();
        }
        //tasktwo.finalize()
       tasktwo.resume()
       semaphore1.wait()
       //print("I WORKED")
       print(firstProjPoints)
       print("First Player")
       print(secondProjPoints)
       print("Second Player")
       
       if (firstProjPoints > secondProjPoints)
       {
            winnerProjPoints = firstProjPoints
            winnerID = firstID!
            nameLabel.text = firstName!
        
       }
       else
       {
            winnerProjPoints = secondProjPoints
            winnerID = secondID!
            nameLabel.text = secondName!
       }
        
        projPointsLabel.text = String(winnerProjPoints)
        
        let playerID:String = String(format:"%d", self.winnerID)
        var urlImage = "https://s3-us-west-2.amazonaws.com/static.fantasydata.com/headshots/nfl/low-res/" + playerID + ".png"
        
        if (try? Data(contentsOf: URL(string: urlImage)!)) == nil
        {
            urlImage = "https://www.statefansnation.com/wp-content/uploads/2017/01/d-fence-defense-sign.jpg"
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            
            let url = URL(string: urlImage)
            let responseData = try? Data(contentsOf: url!)
            let downloadedImage = UIImage(data: responseData!)
            
            //print("hello")
            
            DispatchQueue.main.async {
                self.winnerImageView.image = downloadedImage
            }
            
        }
        
        
        
        //task.resume()
        //tasktwo.resume()

        // Do any additional setup after loading the view.
        
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
