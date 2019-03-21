//
//  ViewController.swift
//  StartSitAppv1.0.0
//
//  Created by Juan Manuel Jimenez Ramos on 3/3/19.
//  Copyright © 2019 Juan Manuel Jimenez Ramos. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class LogInViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
     var databaseRef : DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil
        {
            self.presentLoggedInScreen()
        }
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text
        {
            Auth.auth().signIn(withEmail: email, password: password, completion:
            { (user, error) in
                if let firebaseError = error
                {
                    print(firebaseError.localizedDescription)
                    return
                }
                self.presentLoggedInScreen()
                print("success")
            })
        }
    }
    
    @IBAction func createAccountTapped(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text
        {
            Auth.auth().createUser(withEmail: email, password: password, completion:
            { user, error in
                if let firebaseError = error
                {
                    print(firebaseError.localizedDescription)
                    return
                }
            self.databaseRef = Database.database().reference(withPath: "Users")
            //self.databaseRef?.keepSynced(true)
            self.databaseRef?.child(Auth.auth().currentUser?.uid ?? "N/A").setValue("NO Entries");
            //self.databaseRef?.child(Auth.auth().currentUser?.uid ?? "N/A")
            self.databaseRef?.keepSynced(true)
            self.presentLoggedInScreen()
            //self.databaseRef?.keepSynced(true)
            print("MAAAJOOOOOOORRRRRRRRSUCCCEESSSSSSSSS")
            })
        }
    }
    
    func presentLoggedInScreen()
    {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loggedInVC:LogoutViewController = storyboard.instantiateViewController(withIdentifier: "LoggedInVC")
            as! LogoutViewController
        self.present(loggedInVC, animated: true, completion: nil)
    }
    
    @IBAction func unwindFromSettingsLogin(segue:UIStoryboardSegue) {
        
    }
    
    
}

