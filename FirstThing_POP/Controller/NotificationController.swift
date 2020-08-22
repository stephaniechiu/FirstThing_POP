//
//  NotificationController.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/17/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit
import UserNotifications

/*
 Sends user a notification to check the news at a specific time
 */

extension NewsController: UNUserNotificationCenterDelegate {
    
    func sendNotification() {
            let notificationContent = UNMutableNotificationContent()

            notificationContent.title = "Good morning!"
            notificationContent.body = "Here's what you missed out on last night..."
            
            var dateComponents = DateComponents()
            dateComponents.hour = 12
            dateComponents.minute = 09
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            
            let request = UNNotificationRequest(identifier: "NotificationID", content: notificationContent, trigger: trigger)
            
        UNUserNotificationCenter.current().add(request) { (error) in
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
