//
//  AboutViewController.swift
//  Group-Project
//
//  Created by  on 2022-04-16.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet var firstName : UITextField!
    @IBOutlet var lastName : UITextField!
    @IBOutlet var email : UITextField!
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
@IBAction func logout()
    {
        performSegue(withIdentifier: "Logout", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        firstName.text = mainDelegate.aboutPeople[0].firstname!
        lastName.text = mainDelegate.aboutPeople[0].lastname!
        email.text = mainDelegate.aboutPeople[0].email!
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
