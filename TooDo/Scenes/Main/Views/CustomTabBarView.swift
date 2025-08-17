//
//  CustomTabBarView.swift
//  TooDo
//
//  Created by Yiğit Bal on 13.07.2025.
//

import UIKit
import SnapKit

class CustomTabBarView: UIView {
    
    weak var delegate: CustomTabBarViewDelegate?
    private var selectedTab: TabType = .home
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 25
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: -2)
        view.layer.shadowRadius = 10
        return view
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 0
        return stackView
    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 25
        button.layer.shadowColor = UIColor.systemBlue.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 8
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private var tabButtons: [UIButton] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = .clear
        
        addSubview(containerView)
        containerView.addSubview(stackView)
        containerView.addSubview(addButton)
        
        setupConstraints()
        setupTabButtons()
        setupAddButton()
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.right.equalTo(addButton.snp.left).offset(-20)
        }
        
        addButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(50)
        }
    }
    
    private func setupTabButtons() {
        for tabType in TabType.allCases {
            let button = createTabButton(for: tabType)
            tabButtons.append(button)
            stackView.addArrangedSubview(button)
        }
        
        updateTabSelection()
    }
    
    private func createTabButton(for tabType: TabType) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(tabType.icon, for: .normal)
        button.tintColor = .systemGray
        button.tag = tabType.rawValue
        button.addTarget(self, action: #selector(tabButtonTapped(_:)), for: .touchUpInside)
        
        button.snp.makeConstraints {
            $0.width.height.equalTo(44)
        }
        
        return button
    }
    
    private func setupAddButton() {
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    @objc private func tabButtonTapped(_ sender: UIButton) {
        guard let tabType = TabType(rawValue: sender.tag) else { return }
        selectedTab = tabType
        updateTabSelection()
        delegate?.didTapTab(tabType)
    }
    
    @objc private func addButtonTapped() {
        delegate?.didTapAddButton()
    }
    
    private func updateTabSelection() {
        for (index, button) in tabButtons.enumerated() {
            let tabType = TabType(rawValue: index) ?? .home
            let isSelected = tabType == selectedTab
            
            UIView.animate(withDuration: 0.2) {
                button.tintColor = isSelected ? .systemBlue : .systemGray
                button.transform = isSelected ? CGAffineTransform(scaleX: 1.1, y: 1.1) : .identity
            }
        }
    }
    
    func selectTab(_ tab: TabType) {
        selectedTab = tab
        updateTabSelection()
    }
}
