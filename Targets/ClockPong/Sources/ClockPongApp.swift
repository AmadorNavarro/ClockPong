import SwiftUI

@main
struct ClockPongApp: App {
    var body: some Scene {
        WindowGroup {
            GameView(controller: GameController())
        }
    }
}
