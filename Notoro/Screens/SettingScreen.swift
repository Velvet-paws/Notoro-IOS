import SwiftUI

enum ThemeType: String, Identifiable, CaseIterable {
    case light, dark, system
    var id: Self { self }
}

struct SettingScreen: View {
    @EnvironmentObject var setting: Setting
   
    
    var body: some View {
        Form {
            FormGeneralSectionView(setting: setting)
        }
        .tint(.accentColor)
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationView {
        SettingScreen()
            .environmentObject(Setting())
    }
}

struct FormGeneralSectionView: View {
    @ObservedObject var setting: Setting
    @EnvironmentObject var taskList: TaskList
    var body: some View {
        Section("General") {
            Picker("Theme", selection: $setting.theme) {
                ForEach(ThemeType.allCases) { theme in
                    Text(theme.rawValue.capitalized)
                        .tag(theme)
                }
            }
            .accessibilityLabel("Theme Picker")
            
            Button("Clear Favorites") {
                taskList.clearFavorites()
            }
            
            Button("Clear All Tasks") {
                taskList.clearTasks()
            }
        }
    }
}
