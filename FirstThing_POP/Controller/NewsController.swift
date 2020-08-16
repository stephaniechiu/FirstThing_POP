//
//  NewsController.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/14/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit
import UserNotifications

class NewsController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
    // MARK: - Properties
    
    let newsView = NewsView()
    let newsTableView = UITableView()
    let userNotificationCenter = UNUserNotificationCenter.current()
//    var newsViewModel = [NewsViewModel]()
    var articles = [Article]()
    let newsURL = "https://newsapi.org/v2/top-headlines?country=us&apiKey=e2f0b28b0f0146dcb2b9c2ce5c3142a7"
        
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = newsView
        
        setupNavigationController()
        setupLayout()
        setupTableView()
        
        if let url = URL(string: newsURL) {
            if let data = try? Data(contentsOf: url) {
                getLatestNewsArticles(json: data)
            }
        }
        
//        userNotificationCenter.delegate = self
        requestNotificationAuthorization()
        sendNotification()
    }
        
    // MARK: - API Call
        //Create view model > api call. Create delegate (ex apidelegate), update with data
    func getLatestNewsArticles(json: Data) {
        let decoder = JSONDecoder()

        if let JSONArticles = try? decoder.decode(Articles.self, from: json) {
            articles = JSONArticles.articles
            print(articles)
            newsTableView.reloadData()
        }
    }
    
    // MARK: - Helper Functions

    func setupNavigationController() {
        navigationController?.navigationBar.tintColor = .clear
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupLayout() {
        view.addSubview(newsTableView)
        newsTableView.anchor(top: newsView.firstThingTitle.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 20)
    }
    
    func setupTableView() {
        newsTableView.dataSource = self
        newsTableView.delegate = self
        newsTableView.register(UITableViewCell.self, forCellReuseIdentifier: Cell.titleCellID)
//        newsTableView.register(NewsDetailsTableViewCell.self, forCellReuseIdentifier: Cell.detailsCellID)
        newsTableView.estimatedRowHeight = 50
        newsTableView.rowHeight = UITableView.automaticDimension
        newsTableView.separatorStyle = .none
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

    //Put in protocol. title and body
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
    
// MARK: - TableView Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.titleCellID, for: indexPath)
        let articleTitle = articles[indexPath.row]
        cell.textLabel?.text = articleTitle.title
        return cell
    }
}

