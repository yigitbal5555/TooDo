//
//  RegisterController.swift
//  TooDo
//
//  Created by Yiğit Bal on 18.06.2025.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    
    private let backgroundImageView3 = UIImageView(image: UIImage(named: "LaunchScreenImage"))
    private let maskView2 = UIView()
    private let stackView2 = UIStackView()
    private let container2 = UIView()
    private var imageView2 = UIImageView()
    private let titleLabel2 = UILabel()
    private let imageContainer = UIView()
    private let textField1 = UITextField()
    private let textField2 = UITextField()
    private let fieldTitles = ["Full Name", "Email", "Password", "Confirm Password"]
    private var previousField: UIView? = nil
    private var signInButton = UIButton(type: .system)
    private var signInButtonView = UIView()
    private let signInSubtitleLabel = UILabel()
    private var textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImageView3)
        backgroundImageView3.contentMode = .scaleToFill
        backgroundImageView3.snp.makeConstraints { $0.edges.equalToSuperview() }
        
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
        
        stackView2.addArrangedSubview(textField)
        
        // Create all text fields first
        for (_, title) in fieldTitles.enumerated() {
            let customFieldContainer = UIView()
            let fieldImageView = UIImageView()
            let fieldText = UITextField()
            
            //Password Secure Checking Part:
            let fieldTitles = ["Password", "Confirm Password"]
            
            for (_, title) in fieldTitles.enumerated() {
                let textField = UITextField()
                textField.placeholder = title
                textField.borderStyle = .roundedRect
                textField.autocapitalizationType = .none
                textField.autocorrectionType = .no
                textField.font = UIFont(name: "LeaugeSpartan-Light", size: 20)
                // Make secure entry only for password fields
                if title.lowercased().contains("password") {
                    textField.isSecureTextEntry = true
                }
            }
            
            if let fieldImage = UIImage(named: "Rectangle 7") {
                fieldImageView.image = fieldImage
                fieldImageView.contentMode = .scaleToFill
            }
            
            customFieldContainer.addSubview(fieldImageView)
            fieldImageView.snp.makeConstraints {
                $0.edges.equalToSuperview()
                $0.height.equalTo(50)
            }
            
            fieldText.placeholder = title
            fieldText.borderStyle = .none
            fieldText.backgroundColor = .clear
            fieldText.textAlignment = .left
            fieldText.textColor = .black
            fieldText.font = UIFont.systemFont(ofSize: 16)
            
            customFieldContainer.addSubview(fieldText)
            fieldText.snp.makeConstraints {
                $0.edges.equalToSuperview().inset(12)
            }
            container2.addSubview(customFieldContainer)
            customFieldContainer.snp.makeConstraints {
                if let previous = previousField {
                    $0.top.equalTo(previous.snp.bottom).offset(16)
                } else {
                    $0.top.equalToSuperview().offset(50)
                }
                $0.leading.trailing.equalToSuperview().inset(20)
                $0.height.equalTo(50)
            }
            previousField = customFieldContainer
        }
        // Add sign-in button after all text fields are created
        container2.addSubview(signInButton)
        if let buttonImage = UIImage(named: "Group 223 2") {
            signInButton.setBackgroundImage(buttonImage, for: .normal)
            signInButton.sizeToFit()
        }
        if let lastField = previousField {
            signInButton.snp.makeConstraints {
                $0.top.equalTo(lastField.snp.bottom).offset(40)
                $0.centerX.equalToSuperview()
                $0.width.equalTo(signInButton.frame.width)
                $0.height.equalTo(signInButton.frame.height)
                $0.bottom.lessThanOrEqualToSuperview().offset(-20)
            }
            
            container2.addSubview(signInSubtitleLabel)
            signInSubtitleLabel.text = "Already have an account? Sign in."
            signInSubtitleLabel.textColor = .systemGray
            signInSubtitleLabel.textAlignment = .center
            
            signInSubtitleLabel.snp.makeConstraints {
                $0.top.equalTo(lastField.snp.bottom).offset(80)
                $0.centerX.equalToSuperview()
                
                $0.width.equalTo(signInButton.frame.width)
                $0.height.equalTo(signInButton.frame.height)
                $0.bottom.lessThanOrEqualToSuperview().offset(-30)
            }
        }
    }
}
