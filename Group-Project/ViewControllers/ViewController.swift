//
//  ViewController.swift
//  Group-Project
//
//  Created by  on 2022-03-29.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var imageBack : UIImageView!
    @IBOutlet var lblRegister : UILabel!
    
    @IBOutlet var tfUsername: UITextField!
    
    @IBOutlet var tfPassword : UITextField!
    
    
    @IBAction func loginPerson(sender : Any)
    {
        
       
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        let retrunCode = mainDelegate.loginIntoApp(username: tfUsername.text!, password: tfPassword.text!)
        
        var retrunMSG : String = "Person logged in"


        
        if retrunCode == false {
            retrunMSG = "Not loggedIn"
        }else{
            performSegue(withIdentifier: "LoginToHome", sender: self)

        }
        
        let alertController = UIAlertController(title: "Login Status", message: retrunMSG, preferredStyle: .alert)
    
    
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)

        alertController.addAction(cancelAction)
        present(alertController, animated: true)
        
        

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        let touch : UITouch = touches.first!
        let touchPoint : CGPoint = touch.location(in: self.view!)
        
        let tableFrame : CGRect = lblRegister.frame
        
        if tableFrame.contains(touchPoint){
            
            performSegue(withIdentifier: "LoginToRegister", sender: self)
            
        }
     
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageBack.image = UIImage(imageLiteralResourceName: "bg5")
    }


}

