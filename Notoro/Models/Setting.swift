import SwiftUI

class Setting: ObservableObject {
    @AppStorage("appTheme") var theme: ThemeType = .system {
        didSet {
            updateColorScheme()
        }
    }
    @Published var colorScheme: ColorScheme? = nil
    
    func updateColorScheme() {
        switch theme {
        case .light:
            colorScheme = .light
        case .dark:
            colorScheme = .dark
        case .system:
            colorScheme = nil
        }
    }
}
