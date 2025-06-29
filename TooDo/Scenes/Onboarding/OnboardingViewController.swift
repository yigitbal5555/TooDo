//
//  OnboardingViewController.swift
//  TooDo
//
//  Created by Yiğit Bal on 4.06.2025.
//

import UIKit
import SnapKit

struct OnboardingContent {
    let imageName: String
    let title: String
    let subtitle: String
    let buttons: Bool
}

final class OnboardingViewController: UIViewController {
    
    private let backgroundImageView = UIImageView(image: UIImage(named: "LaunchScreenImage"))
    private let maskView = UIView()
    
    private let stackView = UIStackView()
    private let container = UIView()
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let nextButton = UIButton(type: .system)
    private let backButton = UIButton()
    private let getStartedButton = UIButton()
    
    private var currentPage = 0
    
    private let pages: [OnboardingContent] = [
        OnboardingContent(imageName: "Group 764", title: "Manage your tasks", subtitle: "Easily record, manage, and receive notifications for all your tasks in Toodo!", buttons: true),
        OnboardingContent(imageName: "Icon", title: "Track your habits", subtitle: "Log your daily and weekly habits, track your progress, stay motivated, and achieve your goals!", buttons: true),
        OnboardingContent(imageName: "Icon (1)", title: "Create reminders", subtitle: "Never miss an important moment or plan! Set reminders and get notified right on time!", buttons: true)
//        OnboardingContent(imageName: <#T##String#>, title: <#T##String#>, subtitle: <#T##String#>, buttons: <#T##Bool#>)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupBaseView()
        setupStackView()
        configure(with: pages[0])
        
        getStartedButton.addTarget(self, action: #selector(getStartedTapped), for: .touchUpInside)

    }
    
    private func setupBaseView() {
        backgroundImageView.contentMode = .scaleToFill
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        maskView.backgroundColor = UIColor(white: 0, alpha: 0.05)
        backgroundImageView.addSubview(maskView)
        maskView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 30
        stackView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        stackView.layer.shadowColor = UIColor.gray.cgColor
        stackView.layer.shadowOpacity = 0.0987
        stackView.layer.shadowOffset = CGSize(width: 0, height: -10)
        stackView.layer.shadowRadius = 2
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(container)
        
        stackView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.59)
        }
        container.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        [imageView, titleLabel, subtitleLabel, nextButton, backButton, getStartedButton].forEach { container.addSubview($0) }
        
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(20)
            $0.width.equalTo(150)
            $0.height.equalTo(225)
        }
        
        titleLabel.font = UIFont(name: "LeagueSpartan-Medium", size: 36)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(0)
            $0.leading.trailing.equalToSuperview().inset(12)
        }
        
        subtitleLabel.font = UIFont(name: "LeagueSpartan-Light", size: 16)
        subtitleLabel.textAlignment = .center
        subtitleLabel.textColor = .black
        subtitleLabel.numberOfLines = 0
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(48)
            $0.leading.trailing.equalToSuperview().inset(48)
        }
        
        nextButton.setBackgroundImage(UIImage(named: "Frame 647 (1)"), for: .normal)
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        nextButton.sizeToFit()
        nextButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(32)
            $0.bottom.equalToSuperview().inset(60)
        }
        
        backButton.setBackgroundImage(UIImage(named: "Frame 647 (3)"), for: .normal)
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        backButton.sizeToFit()
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(32)
            $0.bottom.equalToSuperview().inset(60)
        }
        
        getStartedButton.setBackgroundImage(UIImage(named: "Frame 223"), for: .normal)
        getStartedButton.addTarget(self, action: #selector(getStartedTapped), for: .touchUpInside)
        getStartedButton.sizeToFit()
        getStartedButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(32)
            $0.bottom.equalToSuperview().inset(60)
        }
}
    
    private func configure(with content: OnboardingContent) {
        imageView.image = UIImage(named: content.imageName)
        titleLabel.text = content.title
        subtitleLabel.text = content.subtitle
        
        backButton.isHidden = currentPage == 0
        backButton.isEnabled = currentPage > 0
        
        nextButton.isHidden = currentPage == pages.count - 1
        
        let isLastPage = currentPage == pages.count - 1
          getStartedButton.alpha = isLastPage ? 1 : 0
          getStartedButton.isUserInteractionEnabled = isLastPage
    }
    
    @objc private func nextTapped() {
        currentPage += 1
        if currentPage < pages.count {
            configure(with: pages[currentPage])
        }
        else {
            print("Finished onboarding")
        }
    }
    @objc private func backTapped() {
            currentPage -= 1
            if currentPage >= 0 {
                configure(with: pages[currentPage])
            }
        }
    @objc private func getStartedTapped() {let homeVC = HomeController()
        let navigationController = UINavigationController(rootViewController: homeVC)
           if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            window.rootViewController = navigationController
            UIView.transition(with: window,
                              duration: 0.4,
                              options: .transitionFlipFromRight,
                              animations: nil)
        }
    }
}
    
