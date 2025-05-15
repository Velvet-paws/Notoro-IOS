import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var setting: Setting
    
    
    var body: some View {
        NavigationView {
            HomeView()
        }
        .preferredColorScheme(setting.theme == .system ? nil : setting.colorScheme)
        .onAppear {
            setting.updateColorScheme()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Setting())
}
