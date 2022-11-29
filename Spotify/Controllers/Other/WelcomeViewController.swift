//
//  WelcomeViewController.swift
//  Spotify
//
//  Created by Pratyush  on 9/7/21.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Sign In with Spotify", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12.0
        button.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
        addAllSubviews()
    }
    
}

private extension WelcomeViewController {
    
    func setupview() {
        title = "Spotify"
        view.backgroundColor = .systemGreen
    }
    
    func addAllSubviews() {
        view.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.width.equalTo(view.width - 40)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(view.height - 50 - view.safeAreaInsets.bottom)
        }
    }
    
    @objc func didTapSignIn() {
        let vc = AuthViewController()
        vc.completionHandler = {  [weak self] success in
            self?.handleSignIn(success: success)
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func handleSignIn(success: Bool) {
        guard success else {
            let alert = UIAlertController(title: "Oops", message: "Something Went Wrong", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        let mainAppTabBarVC = TabBarViewController()
        mainAppTabBarVC.modalPresentationStyle = .fullScreen
        present(mainAppTabBarVC, animated: true, completion: nil)
    }
    
    
    
}
