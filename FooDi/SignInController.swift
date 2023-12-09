//
//  SignInController.swift
//  FooDi
//
//  Created by Tyrone Vera on 6/12/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignInController: UIViewController {
    @IBOutlet weak var emailSignIn: UITextField!
    @IBOutlet weak var passwordSignIn: UITextField!
    private let db = Firestore.firestore()
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func signInButtonAction() {
        if let email = emailSignIn.text, let password = passwordSignIn.text {
            Auth.auth().createUser(withEmail: email, password: password){ (result, error) in
                if let _ = result, error == nil {
                    self.db.collection("users").document("\(email)").setData(["email" : email])
                    self.defaults.set(email, forKey: "email")
                    self.performSegue(withIdentifier: "CreateAccountSegue", sender: nil)
                    let alertController = UIAlertController(title: "Registro exitoso", message: "Tu cuenta ha sido creada", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }else {
                    if let error1 = error as? NSError {
                        self.errorSignInManagment(error: error1)
                    }
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreateAccountSegue" {
            let destination = segue.destination as! AccountCreationController
            if let email = emailSignIn.text {
                destination.emailSigned = email
            }
            
        }
    }
    private func errorSignInManagment (error: NSError?) {
        guard let errorSended = error else {
            return
        }
        switch (errorSended.code){
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
