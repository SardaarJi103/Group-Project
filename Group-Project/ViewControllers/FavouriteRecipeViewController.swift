//
//  FavouriteRecipeViewController.swift
//  Group-Project
//
//  Created by  on 2022-04-16.
//

import UIKit

class FavouriteRecipeViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mainDelegate.likedRecipes.count
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mainDelegate.likedRecipes[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        let alertContrller = UIAlertController(title: mainDelegate.people[row].email, message: mainDelegate.people[row].food, preferredStyle: .alert)
//
//        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//
//        alertContrller.addAction(cancelAction)
//
//        present(alertContrller, animated: true)
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
