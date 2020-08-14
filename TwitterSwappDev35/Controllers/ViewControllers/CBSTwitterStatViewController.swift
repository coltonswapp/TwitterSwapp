//
//  CBSTwitterStatViewController.swift
//  TwitterSwappDev35
//
//  Created by Colton Swapp on 8/13/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import UIKit

class CBSTwitterStatViewController: UIViewController {
    
    var users: [CBSTwitterUser] = []
    
    // MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var tweetCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
    }
    

    

}

extension CBSTwitterStatViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        
        self.searchBar.endEditing(true)
        
        CBSUserController.fetchUser(forSearchTerm: searchTerm) { (users) in
            
            guard let users = users else { return }
            let user = users[0]
            
            DispatchQueue.main.async {
                self.displayNameLabel.text = user.name
                self.usernameLabel.text = "@\(user.username)"
                self.followersLabel.text = "Followers: \(user.publicMetrics.followers_count)"
                self.followingLabel.text = "Following: \(user.publicMetrics.following_count)"
                self.tweetCountLabel.text = "Tweet Count: \(user.publicMetrics.tweet_count)"
            }
        }
        
        
    }
    
}
