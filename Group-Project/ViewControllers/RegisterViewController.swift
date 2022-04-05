//
//  RegisterViewController.swift
//  Group-Project
//
//  Created by  on 2022-03-29.
//

import UIKit

class RegisterViewController: UIViewController {

    
    
    @IBOutlet var lblLogin : UILabel!
    
    @IBOutlet var tfName : UITextField!
    
    @IBOutlet var tfLastName : UITextField!
    @IBOutlet var tfEMail:UITextField!
    @IBOutlet var tfPassword:UITextField!
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        let touch : UITouch = touches.first!
        let touchPoint : CGPoint = touch.location(in: self.view!)
        
        let tableFrame : CGRect = lblLogin.frame
        
        if tableFrame.contains(touchPoint){
            
            performSegue(withIdentifier: "RegisterToLogin", sender: self)
            
        }
     
        
    }
    
    
    @IBAction func addPerson(sender : Any)
    {
        let person : Data1 = Data1.init()
        
        person.initWithData(theRow: 0, theFirstName: tfName.text!, theLastName: tfLastName.text!, theEmail: tfEMail.text!, thePassword: tfPassword.text!, theSubscribe: 1)

       
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        let retrunCode = mainDelegate.insertIntoDatabaseUsers(person: person)
        
        var retrunMSG : String = "Person added"

        
        if retrunCode == false {
            retrunMSG = "Person not aded"
        }
        
        let alertController = UIAlertController(title: "SQL Lite add", message: retrunMSG, preferredStyle: .alert)
    
    
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)

        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
