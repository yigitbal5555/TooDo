//
//  LoginController.swift
//  TooDo
//
//  Created by Yiğit Bal on 18.06.2025.
//

import UIKit
import SnapKit

final class SignInController: UIViewController {
    
    // MARK: - UI Elements
    private let backgroundImageView3 = UIImageView(image: UIImage(named: "LaunchScreenImage"))
    
    private let customImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let stackViewofSignIn = UIStackView()
    private let containerofStackView = UIView()
    
    private let emailBackgroundImage = UIImageView(image: UIImage(named: "Rectangle 7"))
    private let emailTextField = UITextField()
    
    private let passwordBackgroundImage = UIImageView(image: UIImage(named: "Rectangle 7"))
    private let passwordTextField = UITextField()
    
    private let forgotPasswordButton = UIButton(type: .system)
    private let signInButton = UIButton(type: .system)
    
    // Divider
    private let dividerContainer = UIView()
    private let leftLine = UIView()
    private let rightLine = UIView()
    private let dividerLabel = UILabel()
    
    // Social Buttons
    private let phoneLoginButton = UIButton()
    private let googleLoginButton = UIButton()
    private let appleLoginButton = UIButton()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupStackView()
        setupTextFields()
    }
    
    // MARK: - Setup Background
    private func setupBackground() {
        view.addSubview(backgroundImageView3)
        backgroundImageView3.contentMode = .scaleToFill
        backgroundImageView3.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        view.addSubview(customImageView)
        customImageView.snp.makeConstraints {
            $0.width.equalTo(288)
            $0.height.equalTo(60.38)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(234.07)
        }
    }
    
    // MARK: - Setup StackView
    private func setupStackView() {
        view.addSubview(stackViewofSignIn)
        stackViewofSignIn.axis = .vertical
        stackViewofSignIn.backgroundColor = .white
        stackViewofSignIn.layer.cornerRadius = 30
        stackViewofSignIn.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        stackViewofSignIn.layer.shadowColor = UIColor.gray.cgColor
        stackViewofSignIn.layer.shadowOpacity = 0.0987
        stackViewofSignIn.layer.shadowOffset = CGSize(width: 0, height: -10)
        stackViewofSignIn.layer.shadowRadius = 2
        
        stackViewofSignIn.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.59)
        }
        
        stackViewofSignIn.addArrangedSubview(containerofStackView)
        containerofStackView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    // MARK: - Setup Text Fields and Buttons
    private func setupTextFields() {
        // Email Field
        containerofStackView.addSubview(emailBackgroundImage)
        containerofStackView.addSubview(emailTextField)
        
        emailBackgroundImage.layer.cornerRadius = 12
        emailBackgroundImage.layer.borderWidth = 0.8
        emailBackgroundImage.layer.borderColor = UIColor.gray.cgColor
        emailBackgroundImage.clipsToBounds = true
        emailBackgroundImage.contentMode = .scaleAspectFit
        emailBackgroundImage.isUserInteractionEnabled = false
        
        emailTextField.placeholder = "Email"
        emailTextField.font = UIFont(name: "LeagueSpartan-Light", size: 20)
        emailTextField.textColor = .gray
        emailTextField.backgroundColor = .clear
        emailTextField.borderStyle = .none
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        
        emailBackgroundImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(48)
            $0.leading.equalToSuperview().offset(32)
            $0.width.equalTo(338)
            $0.height.equalTo(48)
        }
        
        emailTextField.snp.makeConstraints {
            $0.edges.equalTo(emailBackgroundImage).inset(12)
        }
        
        // Password Field
        containerofStackView.addSubview(passwordBackgroundImage)
        containerofStackView.addSubview(passwordTextField)
        
        passwordBackgroundImage.layer.cornerRadius = 12
        passwordBackgroundImage.layer.borderWidth = 0.8
        passwordBackgroundImage.layer.borderColor = UIColor.gray.cgColor
        passwordBackgroundImage.clipsToBounds = true
        passwordBackgroundImage.contentMode = .scaleAspectFit
        passwordBackgroundImage.isUserInteractionEnabled = false
        
        passwordTextField.placeholder = "Password"
        passwordTextField.font = UIFont(name: "LeagueSpartan-Light", size: 20)
        passwordTextField.textColor = .gray
        passwordTextField.backgroundColor = .clear
        passwordTextField.borderStyle = .none
        passwordTextField.isSecureTextEntry = true
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
        
        passwordBackgroundImage.snp.makeConstraints {
            $0.top.equalTo(emailBackgroundImage.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(32)
            $0.width.equalTo(338)
            $0.height.equalTo(48)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.edges.equalTo(passwordBackgroundImage).inset(12)
        }
        
        // Forgot Password Button
        containerofStackView.addSubview(forgotPasswordButton)
        
        let attributedTitle = NSAttributedString(
            string: "Forgot Password?",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14, weight: .light),
                .foregroundColor: UIColor.gray,
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
        )
        forgotPasswordButton.setAttributedTitle(attributedTitle, for: .normal)
        forgotPasswordButton.contentHorizontalAlignment = .right
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordTapped), for: .touchUpInside)
        
        forgotPasswordButton.snp.makeConstraints {
            $0.top.equalTo(passwordBackgroundImage.snp.bottom).offset(10)
            $0.trailing.equalTo(passwordBackgroundImage)
            $0.height.equalTo(20)
            $0.width.equalTo(160)
        }
        
        // Sign In Button
        containerofStackView.addSubview(signInButton)
        signInButton.setBackgroundImage(UIImage(named: "Group 223"), for: .normal)
        signInButton.backgroundColor = .black
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        signInButton.layer.cornerRadius = 12
        signInButton.clipsToBounds = true
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        
        signInButton.snp.makeConstraints {
            $0.top.equalTo(forgotPasswordButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(32)
            $0.width.equalTo(338)
            $0.height.equalTo(48)
        }
        
        // Divider
        containerofStackView.addSubview(dividerContainer)
        
        dividerContainer.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(32)
            $0.trailing.equalToSuperview().offset(-32)
            $0.height.equalTo(20)
        }
        
        dividerContainer.addSubview(leftLine)
        leftLine.backgroundColor = UIColor.systemGray3
        
        dividerContainer.addSubview(rightLine)
        rightLine.backgroundColor = UIColor.systemGray3
        
        dividerContainer.addSubview(dividerLabel)
        dividerLabel.text = "or sign in with"
        dividerLabel.font = UIFont(name: "LeagueSpartan-Light", size: 18)
        dividerLabel.textColor = .gray
        dividerLabel.textAlignment = .center
        dividerLabel.setContentHuggingPriority(.required, for: .horizontal)
        
        leftLine.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(1)
            $0.trailing.equalTo(dividerLabel.snp.leading).offset(-8)
        }
        
        dividerLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        rightLine.snp.makeConstraints {
            $0.leading.equalTo(dividerLabel.snp.trailing).offset(8)
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        let socialStack = UIStackView(arrangedSubviews: [phoneLoginButton, googleLoginButton, appleLoginButton])
        socialStack.axis = .horizontal
        socialStack.spacing = 16
        socialStack.alignment = .fill
        socialStack.distribution = .fillEqually
        
        containerofStackView.addSubview(socialStack)
        
        // Set button images (replace with your actual asset names)
        phoneLoginButton.setBackgroundImage(UIImage(named: "phoneButton"), for: .normal)
        googleLoginButton.setBackgroundImage(UIImage(named: "googleButton"), for: .normal)
        appleLoginButton.setBackgroundImage(UIImage(named: "appleButton"), for: .normal)
        
        // StackView Constraints (total width: 3×102 + 2×16 = 338)
        socialStack.snp.makeConstraints { make in
            make.top.equalTo(dividerContainer.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(338)
            make.height.equalTo(45)
        }
    }
    
    @objc private func forgotPasswordTapped() {
        let forgotPasswordController = ForgetPasswordController()
        navigationController?.pushViewController(forgotPasswordController, animated: true)
        }

    @objc private func signInButtonTapped() {
        print("Sign In button tapped")
    }
}
