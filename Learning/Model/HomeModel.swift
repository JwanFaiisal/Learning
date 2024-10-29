import Foundation
import SwiftUI

// Structure for Home model data
struct HomeModel {
    var streak: Int = 0              // Streak counter for consecutive learning days
    var freezesUsed: Int = 0         // Count of used freezes
    var maxFreezes: Int = 6          // Maximum allowed freezes
    var todayLearned: Bool = false   // Indicates if today is marked as learned
    var freezeLearned: Bool = false  // Indicates if today is frozen
    var previousStreak: Int = 0      // Previous streak value before freeze
    var previousFreezesUsed: Int = 0 // Previous freezesUsed value before freeze
}
