//
//  LoginViewController.swift
//  FirstLoginPage
//
//  Created by Нурлан Разак on 9/23/19.
//  Copyright © 2019 develops. All rights reserved.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func validateFields () -> String? {
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
                return "fill all fields"
        }
        
        return nil
        
    }
    
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        let error = validateFields()
        
        if error != nil {
            
            showError(error!)
        }
        else {
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password  = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let actionCodeSettings = ActionCodeSettings.init()
        actionCodeSettings.handleCodeInApp = true
            actionCodeSettings.url = URL.init(string: String(format: "https://www.example.com/?email=", email))
            actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
            
            Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
                if error != nil {
                    print(error?.localizedDescription ?? "")
                } else {
                    let alert = UIAlertController(title: "Error", message: "Enter data in Text fields", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            })
//            Auth.auth().sendSignInLink(toEmail: email, actionCodeSettings: actionCodeSettings, completion: { (err) in
//                if let e = err{
//                    print("email not sent")
//                    print(e.localizedDescription)
//                } else {
//                    print("email sent")
//                }
//            })
            
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                transitionToHome()
            }
        }
            func transitionToHome() {
                
                let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
                
                view.window?.rootViewController = homeViewController
                view.window?.makeKeyAndVisible()
            }
    }
    
  
    
    }
    
}
