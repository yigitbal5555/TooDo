//
//  ViewController.swift
//  TooDo
//
//  Created by Yiğit Bal on 31.05.2025.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage(named: "LaunchScreenImage")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let hasSeenOnboarding = UserDefaults.standard.bool(forKey: OnboardingDefaults.hasSeenOnboarding)

        if !hasSeenOnboarding {
            let onboardingVC = OnboardingViewController()
            onboardingVC.modalPresentationStyle = .pageSheet
            present(onboardingVC, animated: true)
        }
    }
    
    private func setBackgroundImage(named: String) {
        let backGroundImageView = UIImageView(frame: view.bounds)
        backGroundImageView.image = UIImage(named: named)
        backGroundImageView.contentMode = .scaleAspectFill
        backGroundImageView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(backGroundImageView)
        view.sendSubviewToBack(backGroundImageView)

        NSLayoutConstraint.activate([
            backGroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backGroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backGroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backGroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

