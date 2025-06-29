//
//  OnboardingScreenView.swift
//  TooDo
//
//  Created by Yiğit Bal on 4.06.2025.
//



import UIKit

class OnboardingScreen: UIView {

    let imageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let nextButton = UIButton(type: .system)
    let pageControl = UIPageControl()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        layoutUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with page: OnboardingPage, index: Int, totalPages: Int) {
        imageView.image = UIImage(named: page.imageName)
        titleLabel.text = page.title
        subtitleLabel.text = page.subtitle
        nextButton.setTitle(index == totalPages - 1 ? "Get Started" : "Next", for: .normal)
        pageControl.currentPage = index
        pageControl.numberOfPages = totalPages
    }

    private func setupViews() {
        backgroundColor = .systemBackground

        imageView.contentMode = .scaleAspectFit
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.textAlignment = .center

        subtitleLabel.font = UIFont.systemFont(ofSize: 16)
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0

        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)

        [imageView, titleLabel, subtitleLabel, nextButton, pageControl].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }

    private func layoutUI() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 250),

            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30),
            nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),

            pageControl.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -20),
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

