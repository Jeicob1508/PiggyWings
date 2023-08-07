//
//  PiggyWingsApp.swift
//  PiggyWings
//
//  Created by Jacobo Osorio on 1/08/23.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

@main
struct PiggyWingsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//Follow: https://firebase.google.com/docs/auth/ios/google-signin#swift_1
//In your app delegate's application:didFinishLaunchingWithOptions: method, configure the FirebaseApp object.
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey :
                                                                    Any]? = nil) -> Bool {
        FirebaseApp.configure ()
        return true
    }
    
    //The method should call the handleURL method of the GIDSignIn instance, which will properly handle the URL that your application receives at the end of the authentication process.
    @available (iOS 9.0, *)
    //it ask the delegate to open the resource specified by the url.
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
}
