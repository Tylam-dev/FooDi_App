//
//  ViewController.swift
//  FooDi
//
//  Created by Tyrone Vera on 5/12/23.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseAnalytics

class LogInController: UIViewController {

    @IBOutlet weak var emailLogIn: UITextField!
    
    @IBOutlet weak var paswordLogIn: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLogIn.delegate = self
        paswordLogIn.delegate = self
        
        emailLogIn.returnKeyType = .done
        paswordLogIn.returnKeyType = .done
        // Do any additional setup after loading the view.
    }

    @IBAction func logInButtonAction() {
        if let email = emailLogIn.text, let password = paswordLogIn.text {
            Auth.auth().signIn(withEmail: email, password: password){ (result, error) in
                if let _ = result, error == nil {
                    self.performSegue(withIdentifier: "HomeSegue", sender: nil)
                }else {
                    if let error1 = error as? NSError {
                        switch (error1.code){
                        case 17009:
                            let alertController = UIAlertController(title: "Error", message: "Contrasenia invalida", preferredStyle: .alert)
                            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                            self.present(alertController, animated: true, completion: nil)
                        case 17008:
                            let alertController = UIAlertController(title: "Error", message: "Correo invalido", preferredStyle: .alert)
                            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                            self.present(alertController, animated: true, completion: nil)
                        default:
                            return
                        }
                    }
                }
            }
        }
    }
}
extension LogInController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
