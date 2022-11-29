//
//  ProfileViewController.swift
//  Spotify
//
//  Created by Pratyush  on 9/7/21.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        APICaller.shared.getCurrentUserProfile { result in
            switch result {
            case .success(let user):
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        
        }
    }

}
