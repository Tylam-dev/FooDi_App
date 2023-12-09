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
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLogIn.delegate = self
        paswordLogIn.delegate = self
        
        emailLogIn.returnKeyType = .done
        paswordLogIn.returnKeyType = .done
        if let emailLogged = defaults.value(forKey: "email") as? String{
            performSegue(withIdentifier: "HomeSegue", sender: nil)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInButtonAction() {
        if let email = emailLogIn.text, let password = paswordLogIn.text {
            Auth.auth().signIn(withEmail: email, password: password){ (result, error) in
                self.defaults.set(email, forKey: "email")
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
