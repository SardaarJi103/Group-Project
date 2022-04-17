//
//  HomeViewController.swift
//  Group-Project
//
//  Created by  on 2022-03-29.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate ,UITableViewDataSource,UISearchResultsUpdating, UISearchBarDelegate {
    
   
    

    let searchController = UISearchController()
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var recipeTableView : UITableView!
    var  filteredRecipes = [Recipe]()
    
    @IBAction func unwindToHomeViewController(sender:UIStoryboardSegue){
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(searchController.isActive){
            return filteredRecipes.count
        }
        return mainDelegate.recipes.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SiteCell ?? SiteCell(style: .default, reuseIdentifier: "cell")
        
        
        let thisRecipe : Recipe!
        if(searchController.isActive){
            thisRecipe = filteredRecipes[indexPath.row]
            
            tableCell.primaryLable.text = thisRecipe.recipeName
            tableCell.myImageView.image = convertStringToImage(m: thisRecipe.recipeImage!)
        }
       
        else{
            let rownNum = indexPath.row
            
            tableCell.primaryLable.text = mainDelegate.recipes[rownNum].recipeName
            tableCell.myImageView.image = convertStringToImage(m: mainDelegate.recipes[rownNum].recipeImage!)
        }
        
//        tableCell.secondaryLabel.text = mainDelegate.recipes[rownNum].recipeDescription
//        tableCell.phoneLabel.text = mainDelegate.people[rownNum].phone
//        tableCell.addressLabel.text = mainDelegate.people[rownNum].address
//        tableCell.ageLabel.text = mainDelegate.people[rownNum].age
//        tableCell.genderLabel.text = mainDelegate.people[rownNum].gender
//        tableCell.dateLabel.text = mainDelegate.people[rownNum].datebirth
        




        tableCell.accessoryType = .disclosureIndicator
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowNum = indexPath.row + 1

        print(rowNum)
        mainDelegate.readSpecificReipe(recipeId: rowNum)
        print(mainDelegate.specificRecipe[0].recipeName)
        
        performSegue(withIdentifier: "HomeToViewRecipe", sender: self)
//
        let alertController = UIAlertController(title: "Recipe CLicked", message: mainDelegate.specificRecipe[0].recipeName, preferredStyle: .alert)


        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)

        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    
    func convertStringToImage(m : String) ->UIImage {
           let data2 = Data(base64Encoded: m,options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
           return UIImage(data:data2)!
       }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        mainDelegate.recipes = []
        mainDelegate.readDataFromDatabase()
         initSearchController()
        // Do any additional setup after loading the view.
    }
   func initSearchController()
    {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        
        
        
    }
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let searchText = searchBar.text!
        
        filterForSearchText(searchText : searchText)
        
    }
    
    func filterForSearchText(searchText : String){
        
        filteredRecipes = mainDelegate.recipes.filter{
            recipe in
            if(searchController.searchBar.text != " "){
                let searchTextMatch = recipe.recipeName!.lowercased().contains(searchText.lowercased())
                return searchTextMatch
            }else{
                return false
            }
          
        }
        recipeTableView.reloadData()
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
