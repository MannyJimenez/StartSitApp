//
//  SettingsViewController.swift
//  StartSitAppv1.0.0
//
//  Created by Juan Manuel Jimenez Ramos on 3/3/19.
//  Copyright © 2019 Juan Manuel Jimenez Ramos. All rights reserved.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var teamPickerView: UIPickerView!
    
    //var teamArray = [String]()
    
    let teamArray = ["ALL", "Arizona Cardinals", "Atlanta Falcons", "Baltimore Ravens", "Buffalo Bills", "Carolina Panthers", "Chicago Bears", "Cincinnati Bengals", "Cleveland Browns", "Dallas Cowboys", "Denver Broncos", "Detroit Lions", "Green Bay Packers", "Houston Texans", "Indianapolis Colts", "Jacksonville Jaguars", "Kansas City Chiefs", "Miami Dolphins", "Minnesota Vikings", "New England Patriots", "New Orleans Saints", "New York Giants", "New York Jets", "Oakland Raiders", "Philadelphia Eagles", "Pittsburgh Steelers", "St. Louis Rams", "San Diego Chargers", "San Francisco 49ers", "Seattle Seahawks", "Tampa Bay Buccaneers", "Tennessee Titans", "Washington Redskins"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamPickerView.delegate = self
        teamPickerView.dataSource = self
        
        if Auth.auth().currentUser == nil
        {
            logoutButton.isEnabled = false
            logoutButton.isHidden = true
            loginButton.isHidden = false
        }
        else
        {
            loginButton.isEnabled = false
            loginButton.isHidden = true
        }
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        /*if (component == 0)
        {
            return res.keys.count
        }
        else if (component == 1)
        {
            let chosenCity = cities[pickerView.selectedRow(inComponent: 0)]
            return res[chosenCity]!.count
        }*/
        return teamArray.count
    }
    
    /*func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel: UILabel? = (view as? UILabel)
        pickerLabel!.font = UIFont(name: "Futura-MediumItalic", size: 17)
        
        return pickerLabel!
    }*/
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        /*if (component == 0){
            return cities[row]
        }
        else if (component == 1){
            let curCity = cities[pickerView.selectedRow(inComponent: 0)]
            return res[curCity]!.sorted()[row]
        }*/
        return teamArray[row]
    }
    
    @IBAction func logoutPushed(_ sender: UIButton) {
        do{
            if Auth.auth().currentUser == nil
            {
                logoutButton.isEnabled = false
                logoutButton.isHidden = true
                loginButton.isHidden = false
                loginButton.isEnabled = true
            }
            else
            {
                loginButton.isEnabled = false
                loginButton.isHidden = true
            }
            try Auth.auth().signOut()
            if Auth.auth().currentUser == nil
            {
                logoutButton.isEnabled = false
                logoutButton.isHidden = true
                loginButton.isHidden = false
                loginButton.isEnabled = true
            }
            else
            {
                loginButton.isEnabled = false
                loginButton.isHidden = true
            }
            //dismiss(animated: true, completion: nil)
        } catch {
            print("THERE WAS A PROB LOGGING OUT")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
