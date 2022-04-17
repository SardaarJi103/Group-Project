//
//  ViewRecipeViewController.swift
//  Group-Project
//
//  Created by  on 2022-04-16.
//

import UIKit

class ViewRecipeViewController: UIViewController {
    @IBOutlet var lblName : UILabel!
    @IBOutlet var lblDesc : UILabel!
    @IBOutlet var imageView : UIImageView!
    @IBOutlet var textFieldName : UITextField!
    @IBOutlet var textFieldDesc : UITextView!
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate

    func convertStringToImage(m : String) ->UIImage {
           let data2 = Data(base64Encoded: m,options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
           return UIImage(data:data2)!
       }
    
    @IBAction func likeRecipe()
    {
        mainDelegate.likedRecipes.append(mainDelegate.specificRecipe[0].recipeName!)
        let alertController = UIAlertController(title: "Recipe Liked", message: mainDelegate.specificRecipe[0].recipeName!, preferredStyle: .alert)


        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)

        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    @IBAction func saveUrl()
    {
        mainDelegate.recipeUrl = mainDelegate.specificRecipe[0].recipeLink!
        performSegue(withIdentifier: "WebView", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldName.text = mainDelegate.specificRecipe[0].recipeName!
        textFieldDesc.text = mainDelegate.specificRecipe[0].recipeDescription!
        imageView.image = convertStringToImage(m: mainDelegate.specificRecipe[0].recipeImage!)
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
