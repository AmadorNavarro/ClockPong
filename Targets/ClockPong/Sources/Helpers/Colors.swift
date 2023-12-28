import SwiftUI

enum ColorName: String {
    case background, foreground
}

extension Color {
    public static let background = Color(ColorName.background.rawValue)
    public static let foreground = Color(ColorName.foreground.rawValue)
}
