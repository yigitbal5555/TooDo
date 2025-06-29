//
//  OnboardingDefaults.swift
//  TooDo
//
//  Created by Yiğit Bal on 4.06.2025.
//

import Foundation

enum OnboardingDefaults {
    static let hasSeenOnboarding = "hasSeenOnboarding"

    static func markOnboardingSeen() {
        UserDefaults.standard.set(true, forKey: hasSeenOnboarding)
    }

    static func isOnboardingSeen() -> Bool {
        return UserDefaults.standard.bool(forKey: hasSeenOnboarding)
    }
}

