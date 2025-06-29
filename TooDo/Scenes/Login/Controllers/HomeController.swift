
//
//  HomeController.swift
//  TooDo
//
//  Created by Yiğit Bal on 18.06.2025.
//

import UIKit
import SnapKit

//MARK: HomeViewController:

class HomeController: UIViewController {
    
    private let backgroundImageView2 = UIImageView(image: UIImage(named: "Group 809"))
    private let maskView2 = UIView()
    private let stackView2 = UIStackView()
    private let container2 = UIView()
    private let imageView2 = UIImageView()
    private let titleLabel2 = UILabel()
    private let substitleLabel2 = UILabel()
    private let orLabel = UILabel()
    private let orStackView = UIStackView()
    private let rightLine = UIView()
    private let leftLine = UIView()
    private let signInButton = UIButton(type: .system)
    private let signUpButton = UIButton(type: .system)
    private let createAccount = UIButton(type: .system)
    private let backgroundImageView3 = UIImageView(image: UIImage(named: "LaunchScreenImage"))
    private let signUpView = SignUpViewController()
    private let bottomSubtitleLabel = UILabel()
    private var textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundImageView2)
        backgroundImageView2.contentMode = .scaleToFill
        backgroundImageView2.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        backgroundImageView2.addSubview(maskView2)
        maskView2.backgroundColor = UIColor(white: 0, alpha: 0.05)
        maskView2.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        view.addSubview(stackView2)
        stackView2.axis = .vertical
        stackView2.backgroundColor = .white
        stackView2.layer.cornerRadius = 30
        stackView2.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        stackView2.layer.shadowColor = UIColor.gray.cgColor
        stackView2.layer.shadowOpacity = 0.0987
        stackView2.layer.shadowOffset = CGSize(width: 0, height: -10)
        stackView2.layer.shadowRadius = 2
        stackView2.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.59)
        }
        
        stackView2.addArrangedSubview(container2)
        container2.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        container2.addSubview(titleLabel2)
        titleLabel2.text = "Welcome to"
        titleLabel2.textColor = .black
        titleLabel2.textAlignment = .center
        titleLabel2.font = UIFont(name: "LeagueSpartan-Medium", size: 36)
        titleLabel2.numberOfLines = 0
        titleLabel2.snp.makeConstraints {
            $0.top.equalToSuperview().offset(48)
            $0.centerX.equalToSuperview()
            $0.leading.greaterThanOrEqualToSuperview().offset(16)
            $0.trailing.lessThanOrEqualToSuperview().offset(-16)
        }
        container2.addSubview(imageView2)
        if let image = UIImage(named: "Frame 800") {
            imageView2.image = image
            imageView2.contentMode = .scaleAspectFit
            imageView2.sizeToFit()
        }
        imageView2.snp.makeConstraints {
            $0.top.equalTo(titleLabel2.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        container2.addSubview(substitleLabel2)
        substitleLabel2.text = "Please sign in to your account or create new account to continue."
        substitleLabel2.numberOfLines = 0
        substitleLabel2.textColor = .darkGray
        substitleLabel2.textAlignment = .center
        substitleLabel2.font = UIFont(name: "LeagueSpartan-Medium", size: 20)
        substitleLabel2.snp.makeConstraints {
            $0.top.equalTo(imageView2.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        container2.addSubview(signInButton)
        if let buttonImage = UIImage(named: "Group 223") {
            signInButton.setBackgroundImage(buttonImage, for: .normal)
            signInButton.sizeToFit()
        }
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        
        signInButton.snp.makeConstraints {
            $0.top.equalTo(substitleLabel2.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(signInButton.frame.width)
            $0.height.equalTo(signInButton.frame.height)
        }
        container2.addSubview(orLabel)
        orLabel.text = "or"
        orLabel.textColor = .red
        orLabel.textAlignment = .center
        orLabel.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        orStackView.axis = .horizontal
        orStackView.alignment = .center
        orStackView.distribution = .fill
        orStackView.spacing = 8
        
        leftLine.backgroundColor = .lightGray
        leftLine.snp.makeConstraints { $0.height.equalTo(1) }
        
        orLabel.text = "or"
        orLabel.textColor = .darkGray
        orLabel.font = .systemFont(ofSize: 14)
        
        rightLine.backgroundColor = .lightGray
        rightLine.snp.makeConstraints { $0.height.equalTo(1) }
        
        orStackView.addArrangedSubview(leftLine)
        orStackView.addArrangedSubview(orLabel)
        orStackView.addArrangedSubview(rightLine)
        
        container2.addSubview(orStackView)
        orStackView.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        leftLine.snp.makeConstraints { $0.width.equalTo(rightLine) }
        
        container2.addSubview(createAccount)
        if let createImage = UIImage(named: "Frame 224") {
            createAccount.setBackgroundImage(createImage, for: .normal)
            createAccount.sizeToFit()
        }
        createAccount.addTarget(self, action: #selector(createAccountTapped), for: .touchUpInside)
        createAccount.snp.makeConstraints {
            $0.top.equalTo(orLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(createAccount.frame.width)
            $0.height.equalTo(createAccount.frame.height)
        }
    }

    //MARK: SignIn Button Tapped:
    
    @objc private func signInTapped() {
        let signInController = SignInController()
        navigationController?.pushViewController(signInController, animated: true)
    }
    
    //MARK: Create Account Button Tapped:
    
    @objc private func createAccountTapped() {
        let signUpViewController = SignUpViewController()
        navigationController?.pushViewController(signUpViewController, animated: true)
        }

    @objc private func phoneLoginButton() {
        print("Phone login tapped")
    }
    
    @objc private func googleLoginButton() {
        print("Google login tapped")
    }
    
    @objc private func appleLoginButton() {
        print("Apple login tapped")
    }
    
    // Forgot Password Tap Function
    @objc private func forgotPasswordTapped() {
            print("Forgot Password tapped")
            // TODO: Navigate to Forgot Password screen
        }
    
    @objc private func signInButtonTapped() {
        print("Sign In button tapped")
        // TODO: Handle sign-in logic or navigation
    }
}
