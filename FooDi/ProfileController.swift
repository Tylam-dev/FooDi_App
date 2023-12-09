//
//  ProfileController.swift
//  FooDi
//
//  Created by Tyrone Vera on 8/12/23.
//

import UIKit
import FirebaseAuth

class ProfileController: UIViewController {
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignOutButtonAction(_ sender: UIButton) {
        
        defaults.removeObject(forKey: "email")
        do{
            try Auth.auth().signOut()
            performSegue(withIdentifier: "LogInReturnSegue", sender: nil)
        } catch {
            
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
