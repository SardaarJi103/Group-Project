//
//  AddRecipeViewController.swift
//  Group-Project
//
//  Created by  on 2022-03-30.
//

import UIKit

class AddRecipeViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var rName : UITextField!
    @IBOutlet var imageView : UIImageView!
    
    @IBOutlet var rDesc : UITextView!
    @IBOutlet var rLink:UITextField!
    
    var imageStringValue : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapButton(){
        let vc = UIImagePickerController()
        
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc,animated: true)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
//UIImagePickerController.InfoKey
        
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")]as? UIImage {
            imageView.image = image
            
//           imageValue = image
            
          imageStringValue = convertImageToBase64(m : image)
//            print("Image string value is :     \(imageStringData)")
            
//            imageView2.image = convertStringToImage(m: imageStringData)
        }
       
        
        
        
        //        imageView.image = imag(
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addRecipe(sender:UIButton){
        let recipe : Recipe = Recipe.init()
        
        recipe.initWithData(theRow: 0, theRecipeName: rName.text!, theRecipeImage: imageStringValue, theRecipeDesc: rDesc.text!, theRecipeLink: rLink.text!)

        print("Recipe image string value is   :   " + recipe.recipeImage! + " Recipe Link is :   " + recipe.recipeLink!)
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        let retrunCode = mainDelegate.insertIntoRecipes(recipes: recipe)
        var retrunMSG : String = "Recipe added"

        
        if retrunCode == false {
            retrunMSG = "Recipe not aded"
        }
        else{
            retrunMSG = "Recipe Added"
        }
        
        let alertController = UIAlertController(title: "SQL Lite add", message: retrunMSG, preferredStyle: .alert)
    
    
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)

        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func convertImageToBase64(m : UIImage) -> String {
        let data = m.pngData()!
        return data.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }
    
//    func convertImageToBase64(m : UIImage) -> String {
//        let data = m.pngData()!
//        return data.base64EncodedString(options: Data.Base64DecodingOptions.lineLength64Characters)
//    }
//    func convertStringToImage(m : String) ->UIImage {
//        let data2 = Data(base64Encoded: m,options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
//        return UIImage(data:data2)!
//    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
