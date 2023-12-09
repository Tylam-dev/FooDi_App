//
//  AccountCreationController.swift
//  FooDi
//
//  Created by Tyrone Vera on 8/12/23.
//

import UIKit
import FirebaseFirestore

class AccountCreationController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    let db = Firestore.firestore()
    var emailSigned: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func confirmButtonAction(_ sender: UIButton) {
        if let user = userTextField.text, let name = nameTextField.text{
            db.collection("users").document(emailSigned).setData(["user" : user,
                                                                  "name" : name], merge: true)
        }
        performSegue(withIdentifier: "AccounteCreateHomeSegue", sender: nil)
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
