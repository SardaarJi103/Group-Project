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
            
//            let imageStringData = convertImageToBase64(m : image)
//            print("Image string value is :     \(imageStringData)")
            
//            imageView2.image = convertStringToImage(m: imageStringData)
        }
       
        
        
        
        //        imageView.image = imag(
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
//    func convertImageToBase64(m : UIImage) -> String {
//        let data = m.pngData()!
//        return data.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
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
