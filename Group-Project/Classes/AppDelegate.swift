//
//  AppDelegate.swift
//  Group-Project
//
//  Created by  on 2022-03-29.
//

import UIKit
import SQLite3

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    
    
    
    var databaseName : String? = "ProjectDatabase.db"
    var databasePath : String?
    var people : [Data] = []
    


   
    
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        FirebaseApp.configure()



        
       
        let documentPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        
        let documentDir = documentPaths[0]
        databasePath = documentDir.appending("/" + databaseName!)
        checkAndCreateDatabse()
//        readDataFromDatabase()
        return true
    }
    
    
    func loginIntoApp(username : String, password : String) -> Bool {
        var isLoggedIn : Bool = false
        var db : OpaquePointer? = nil

        if sqlite3_open(self.databasePath, &db) == SQLITE_OK {
            
            var selectStatement : OpaquePointer? = nil
            var selectStatemenrString : String = "select * from users where email = '\(username)' and password = '\(password)'"
            
            if sqlite3_prepare_v2(db, selectStatemenrString, -1, &selectStatement, nil) == SQLITE_OK {
                
                while sqlite3_step(selectStatement) == SQLITE_ROW {
                    
                    let id : Int = Int(sqlite3_column_int(selectStatement,0))
                    
                    let firstName = sqlite3_column_text(selectStatement, 1)
                    
                    let lastName = sqlite3_column_text(selectStatement, 2)
                    
                    let Email2 = sqlite3_column_text(selectStatement, 3)
                    
                    let Password2 = sqlite3_column_text(selectStatement, 4)
                    
                   print("QueryResult")
                    print("\(id) |  \(firstName) | \(Email2) | \(Password2)")
                    
                    isLoggedIn = true
                    print(isLoggedIn)
                    
                }
                sqlite3_finalize(selectStatement)
            }else {
                print("select statetment is wrong")
                isLoggedIn = false
            }
            sqlite3_close(db)
        } else{
            print("Unable to open database")
            isLoggedIn = false
        }
        
        
        return isLoggedIn
    }
    
    func insertIntoDatabaseUsers(person : Data) -> Bool {
        
        var db : OpaquePointer? = nil
        
        var retrunCode : Bool = true
        
        if sqlite3_open(self.databasePath, &db) == SQLITE_OK {
            
            var insertStatement : OpaquePointer? = nil
            var insertStatementString : String = "insert into users values(NULL, ?, ?, ?,?,?)"

            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                
                
                let firstnameStr = person.firstname! as NSString
                let lastnameStr = person.lastname! as NSString
                let emailStr = person.email! as NSString
                let passwordStr = person.password! as NSString
                let SubscribeInt = person.subscribe! as Int32
                
                sqlite3_bind_text(insertStatement, 1, firstnameStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 2, lastnameStr.utf8String, -1, nil)
                
                
                sqlite3_bind_text(insertStatement, 3, emailStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, passwordStr.utf8String, -1, nil)
                
               
               
                
                sqlite3_bind_int(insertStatement, 5,SubscribeInt)
                
                
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print()
                    
                    let rowId = sqlite3_last_insert_rowid(db)
                    print("Successfully inserted row \(rowId)")
                }
                else{
                    print("Counnot insert row")
                    retrunCode = false
                }
                sqlite3_finalize(insertStatement)


                
                
                
                
                
            }else{
                print("Insert Statement Could not be prepared")
                retrunCode = false
            }
            sqlite3_close(db)
        }
        else{
            print("Unable to open database")
            retrunCode = false
        }
        
        return retrunCode
        
    }
    
    func checkAndCreateDatabse()
    {
        
        var success = false
        let fileManager = FileManager.default
        success = fileManager.fileExists(atPath: databasePath!)
        
        if success {
            return
        }
        
        let databasePathFromApp = Bundle.main.resourcePath?.appending("/" + databaseName!)
    
        try? fileManager.copyItem(atPath: databasePathFromApp!, toPath: databasePath!)
    
    }


//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        // Override point for customization after application launch.
//        return true
//    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

