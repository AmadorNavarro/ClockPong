import SwiftUI

struct SpriteView: View, Identifiable {
    var id = UUID()
    var offSet: CGPoint
    var widthScale: CGFloat
    var heightScale: CGFloat
    var direction: Direction
    var velocity: CGFloat
    
    var body: some View {
        Rectangle().fill(Color.foreground)
    }
    
    func reder(in size: CGSize) -> some View {
        let width = size.width * widthScale
        
        return position(x: size.width * offSet.x, y: size.height * offSet.y)
            .frame(width: width, height: width * heightScale)
    }
}

extension SpriteView {
    static func ball() -> Self {
        SpriteView(offSet: CGPoint(x: 0.1, y: 0.5),
                   widthScale: 0.03,
                   heightScale: 1,
                   direction: .upRight,
                   velocity: 0.005)
    }
}

enum Direction {
    case idle, up, down, upRight, upLeft, downRight, downLeft
    
    var xDelta: CGFloat {
        switch self {
        case .idle, .up, .down:
            0
        case .upRight, .downRight:
            1
        case .upLeft, .downLeft:
            -1
        }
    }
    
    var yDelta: CGFloat {
        switch self {
        case .idle:
            0
        case .down, .downRight, .downLeft:
            1
        case .up, .upRight, .upLeft:
            -1
        }
    }
}
