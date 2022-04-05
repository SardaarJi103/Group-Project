//
//  Recipe.swift
//  Group-Project
//
//  Created by  on 2022-03-30.
//

import UIKit

class Recipe: NSObject {
    var id: Int?
    var recipeName : String?
    
    var recipeImage: String?
    var recipeDescription: String?
    var recipeLink : String?
    
    
    
    func initWithData(theRow i : Int, theRecipeName r : String,theRecipeImage ri : String, theRecipeDesc d : String, theRecipeLink l : String){
        
        id = i
        recipeName = r
        recipeImage = ri
        recipeDescription = d
        recipeLink = l
        
        
    }
}
