//
//  SignInController.swift
//  FooDi
//
//  Created by Tyrone Vera on 6/12/23.
//

import UIKit
import FirebaseAuth

class SignInController: UIViewController {
    @IBOutlet weak var emailSignIn: UITextField!
    @IBOutlet weak var passwordSignIn: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func signInButtonAction() {
        if let email = emailSignIn.text, let password = passwordSignIn.text {
            Auth.auth().createUser(withEmail: email, password: password){ (result, error) in
                if let _ = result, error == nil {
                    self.navigationController?.popViewController(animated: true)
                    let alertController = UIAlertController(title: "Registro exitoso", message: "Tu cuenta ha sido creada", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }else {
                    if let error1 = error as? NSError {
                        switch (error1.code){
                        case 17026:
                            let alertController = UIAlertController(title: "Error", message: "La contrasenia debe tener minimo 6 caracteres", preferredStyle: .alert)
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
