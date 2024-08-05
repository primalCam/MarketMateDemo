//import SwiftUI
//
//struct UserPreferencesView: View {
//    @EnvironmentObject var userManager: UserManager
//    @State private var notificationsEnabled: Bool = false
//    @State private var darkMode: Bool = false
//    @State private var locationServicesEnabled = false
//    @State private var emailNotificationsEnabled = false
//    @State private var voiceCommandsEnabled = false
//
//    var body: some View {
//        Form {
//            Section(header: Text("Preferences")) {
//                Toggle("Enable Notifications", isOn: $notificationsEnabled)
//                Toggle("Dark Mode", isOn: $darkMode)
//                Toggle("Enable Location Services", isOn: $locationServicesEnabled)
//                Toggle("Email Notifications", isOn: $emailNotificationsEnabled)
//                Toggle("Enable Voice Commands", isOn: $voiceCommandsEnabled)
//            }
//        }
//        .navigationTitle("User Preferences")
//        .onAppear {
//            if let preferences = userManager.user?.preferences {
//                notificationsEnabled = preferences.notificationsEnabled
//                darkMode = preferences.darkMode
//                locationServicesEnabled = preferences.locationServicesEnabled
//                emailNotificationsEnabled = preferences.emailNotificationsEnabled
//                voiceCommandsEnabled = preferences.voiceCommandsEnabled
//            }
//        }
//        .onDisappear {
//            let newPreferences = UserPreferences(notificationsEnabled: notificationsEnabled, darkMode: darkMode, locationServicesEnabled: locationServicesEnabled, emailNotificationsEnabled: emailNotificationsEnabled ,voiceCommandsEnabled: voiceCommandsEnabled)
//            userManager.updatePreferences(newPreferences)
//        }
//    }
//}
//
//struct UserPreferences: Codable {
//    var notificationsEnabled: Bool
//    var darkMode: Bool
//    var locationServicesEnabled: Bool
//    var emailNotificationsEnabled: Bool
//    var voiceCommandsEnabled: Bool
//}
//
//class UserManager: ObservableObject {
//    @Published var user: User?
//    
//    func updatePreferences(_ preferences: UserPreferences) {
//        // Update the user's preferences
//        user?.preferences = preferences
//    }
//}
//
//class User: ObservableObject {
//    @Published var preferences: UserPreferences?
//}
