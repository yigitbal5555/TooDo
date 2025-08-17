
//
//  HomePageViewController.swift
//  TooDo
//
//  Created by Yiğit Bal on 13.07.2025.
//

import UIKit
import SnapKit

// Forward declarations to resolve compilation order issues
protocol CustomTabBarViewDelegate: AnyObject {
    func didTapTab(_ tab: TabType)
    func didTapAddButton()
}

enum TabType: Int, CaseIterable {
    case home = 0
    case calendar = 1
    case habits = 2
    case reminders = 3
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .calendar: return "Calendar"
        case .habits: return "Habits"
        case .reminders: return "Reminders"
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .home: return UIImage(systemName: "house.fill")
        case .calendar: return UIImage(systemName: "calendar")
        case .habits: return UIImage(systemName: "heart.fill")
        case .reminders: return UIImage(systemName: "bell.fill")
        }
    }
}

enum HomeSection {
    case header
    case datePicker
    case reminders
    case todos
}

class HomePageViewController: UIViewController, CustomTabBarViewDelegate {

    private let headerView = HomeHeaderView()
    private var collectionView: UICollectionView!
    private let addButton = UIButton(type: .custom)
    private let tabBarView = CustomTabBarView()
    
    private var reminders: [Reminder] = [
        Reminder(title: "Team Meeting", time: "9:00 AM", isCompleted: false),
        Reminder(title: "Lunch Break", time: "12:30 PM", isCompleted: true),
        Reminder(title: "Project Review", time: "3:00 PM", isCompleted: false)
    ]
    
    private var todos: [Todo] = [
        Todo(title: "Complete project proposal", priority: .high, dueDate: "Today", isCompleted: false),
        Todo(title: "Review code changes", priority: .medium, dueDate: "Tomorrow", isCompleted: true),
        Todo(title: "Update documentation", priority: .low, dueDate: "Friday", isCompleted: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        setupHeader()
        setupCollectionView()
        setupCustomTabBar()
        setupAddButton()
        
        // Update greeting based on time of day
        headerView.updateGreeting()
    }

    private func setupHeader() {
        view.addSubview(headerView)
        headerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(220)
        }
    }

    private func setupCollectionView() {
        let layout = createCompositionalLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)

        collectionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(100)
        }

        collectionView.register(ReminderCell.self, forCellWithReuseIdentifier: "ReminderCell")
        collectionView.register(TodoCell.self, forCellWithReuseIdentifier: "TodoCell")
    }

    private func setupCustomTabBar() {
        view.addSubview(tabBarView)
        tabBarView.delegate = self
        tabBarView.snp.makeConstraints {
            $0.bottom.left.right.equalToSuperview()
            $0.height.equalTo(93)
        }
    }
    
    private func setupAddButton() {
        addButton.backgroundColor = .systemBlue
        addButton.layer.cornerRadius = 25
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.tintColor = .white
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        view.addSubview(addButton)
        
        addButton.snp.makeConstraints {
            $0.bottom.equalTo(tabBarView.snp.top).offset(-20)
            $0.right.equalToSuperview().offset(-20)
            $0.width.height.equalTo(50)
        }
    }

    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            switch sectionIndex {
            case 0:
                return self.createRemindersSection()
            case 1:
                return self.createTodosSection()
            default:
                return nil
            }
        }
    }

    private func createRemindersSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(160), heightDimension: .absolute(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(110))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(12)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }

    private func createTodosSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(80))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(80))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        section.interGroupSpacing = 12
        return section
    }
    
    @objc private func addButtonTapped() {
        // Handle add button tap
        print("Add button tapped")
    }
    
    // MARK: - CustomTabBarViewDelegate
    
    func didTapTab(_ tab: TabType) {
        switch tab {
        case .home:
            print("Home tab tapped")
        case .calendar:
            print("Calendar tab tapped")
        case .habits:
            print("Habits tab tapped")
        case .reminders:
            print("Reminders tab tapped")
        }
    }
    
    func didTapAddButton() {
        print("Tab bar add button tapped")
    }
}

// MARK: - UICollectionViewDataSource
extension HomePageViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return reminders.count
        case 1:
            return todos.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReminderCell", for: indexPath) as! ReminderCell
            cell.configure(with: reminders[indexPath.item])
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodoCell", for: indexPath) as! TodoCell
            cell.configure(with: todos[indexPath.item])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

// MARK: - UICollectionViewDelegate
extension HomePageViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            print("Reminder tapped: \(reminders[indexPath.item].title)")
        case 1:
            print("Todo tapped: \(todos[indexPath.item].title)")
        default:
            break
        }
    }
}
