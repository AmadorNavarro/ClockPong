import SwiftUI

struct GameView: View {
    
    @ObservedObject var controller: GameController
    
    var body: some View {
        GeometryReader { proxy in
            controller.ball.reder(in: proxy.size)
        }
        .background(Color.background)
        .ignoresSafeArea()
        .onAppear(perform: controller.start)
    }
}
