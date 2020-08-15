//
//  NewsController.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/14/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit
import UserNotifications

class NewsController: UIViewController, UNUserNotificationCenterDelegate {
        
    // MARK: - Properties
    
    let newsView = NewsView()
    let userNotificationCenter = UNUserNotificationCenter.current()
        
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = newsView
        
        setupNavigationController()
        
        userNotificationCenter.delegate = self
        requestNotificationAuthorization()
        sendNotification()
    }
        
    // MARK: - Helper Functions

    func setupNavigationController() {
        navigationController?.navigationBar.tintColor = .clear
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Selectors
    
    // MARK: - Local Notification
    
    func requestNotificationAuthorization() {
            let authOptions = UNAuthorizationOptions.init(arrayLiteral: .alert, .badge, .sound)
            
            //Ask for user permission to send notifications
            self.userNotificationCenter.requestAuthorization(options: authOptions) { (success, error) in
                if let error = error {
                    print("Error: ", error)
                }
            }
        }

        func sendNotification() {
            let notificationContent = UNMutableNotificationContent()

            notificationContent.title = "Good morning!"
            notificationContent.body = "Here's what you missed out on last night..."
    //        notificationContent.badge = NSNumber(value: 3)
            
            var dateComponents = DateComponents()
            dateComponents.hour = 19
            dateComponents.minute = 27
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            
            let request = UNNotificationRequest(identifier: "testNotification", content: notificationContent, trigger: trigger)
            
            userNotificationCenter.add(request) { (error) in
                if let error = error {
                    print("Notification Error: ", error)
                }
            }
        }
        
        func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
            completionHandler()
        }

        func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            completionHandler([.alert, .badge, .sound])
        }
}

