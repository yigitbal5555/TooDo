//
//  SplashViewController.swift
//  TooDo
//
//  Created by Yiğit Bal on 5.06.2025.
//
import UIKit


final class SplashViewController: UIViewController {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "LaunchScreenImage"))
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let maskView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

private extension SplashViewController {
    
    func setupUI() {
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(maskView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        NSLayoutConstraint.activate([
            maskView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor),
            maskView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor),
            maskView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor),
            maskView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor)])
    }
}
