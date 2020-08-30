//
//  NewsController.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/14/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit
import SafariServices

class NewsController: UIViewController {
        
    // MARK: - Properties
    
    let newsView = NewsView()
    let newsTableView = UITableView()
    var articles = [Article]()
    let topHeadlinesURL = NewsURL.topHeadlines
        
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = newsView
        
        setupNavigationController()
        setupLayout()
        setupTableView()
        sendNotification()
        parseFromJSON()
        
        newsTableView.dataSource = self
    }
    
    func parseFromJSON() {
        let networkService = NetworkService()
        articles = networkService.getNewsArticlesByURL(url: topHeadlinesURL)
        
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
        }
    }
}

    //MARK: - TableView Data Source

extension NewsController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = articles[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.titleCellID, for: indexPath) as! NewsTableViewCell
        
        let currentTime = Date()
        let formatter = ISO8601DateFormatter()
        let publishedTime = formatter.date(from: section.publishedAt) ?? currentTime
        let timeSincePublished = Calendar.current.dateComponents([.minute, .hour], from: publishedTime, to: currentTime)
        let minutes = timeSincePublished.minute
        let hours = timeSincePublished.hour
        
        cell.selectionStyle = .none
        
        //Title of article
        cell.newsTitleLabel.text = section.title
        
        //Article description
        cell.descriptionLabel.text = section.description
        
        //Read more button to
        cell.readMoreAction = { sender in
            let articleURL = URL(string: section.url)
            let articleViewController = SFSafariViewController(url: articleURL!)
            self.present(articleViewController, animated: true, completion: nil)
        }
        
        //Time since article was published
        if minutes == 1  && hours ?? 0 < 1 {
            cell.lastUpdatedLabel.text = "\(minutes ?? 0) minute ago"
        } else if minutes ?? 0 < 60 && hours ?? 0 < 1 {
            cell.lastUpdatedLabel.text = "\(minutes ?? 0) minutes ago"
        } else if minutes ?? 1 == 60 || hours ?? 1 == 1 {
            cell.lastUpdatedLabel.text = "\(hours ?? 0) hour ago"
        } else if minutes! < 60 && hours ?? 1 > 1 {
            cell.lastUpdatedLabel.text = "\(hours ?? 0) hours ago"
        }
    
        return cell
    }
}

    //MARK: - User Notification

//Sends user a notification to check the news at a specific time
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

