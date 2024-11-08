//
//  Tiktok_TutorialApp.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 10/28/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct Tiktok_TutorialApp: App {
    // register app delegate for Firebase setup
      @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    // Dependency Injection
    private let authService = AuthService()
    // As of 11/07/24, we inject this guy to follow Dependency Injection pattern.
    // But this guy for now is just for calling functions, it doesn't have any
    // properties that other views are dependent on.
    private let userSerivce = UserService()
    
    var body: some Scene {
        WindowGroup {
            ContentView(authService: authService, userService: userSerivce)
        }
    }
}
