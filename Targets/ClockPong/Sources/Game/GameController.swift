import QuartzCore

final class GameController: ObservableObject {
    
    @Published var ball = SpriteView.ball()
    
    private var displayLink: CADisplayLink?
    
    func start() {
        guard displayLink == nil else { return }
        
        let link = CADisplayLink(target: self, selector: #selector(update))
        link.preferredFrameRateRange = .default
        link.add(to: .main, forMode: .common)
        displayLink = link
    }
    
    @objc private func update() {
        moveBall()
    }
    
    private func moveBall() {
        
        var newOffset = newPosition(ball)
        
        if newOffset.x < 0 {
            ball.direction = ball.direction == .upLeft ? .upRight : .downRight
            newOffset = newPosition(ball)
        }
        
        if newOffset.x > 1 {
            ball.direction = ball.direction == .upRight ? .upLeft : .downLeft
            newOffset = newPosition(ball)
        }
        
        if newOffset.y < 0 {
            ball.direction = ball.direction == .upLeft ? .downLeft : .downRight
            newOffset = newPosition(ball)
        }
        
        if newOffset.y > 1 {
            ball.direction = ball.direction == .downLeft ? .upLeft : .upRight
            newOffset = newPosition(ball)
        }
        
        ball.offSet = newOffset
    }
    
    private func newPosition(_ sprite: SpriteView) -> CGPoint {
        CGPoint(x: sprite.offSet.x + sprite.direction.xDelta * sprite.velocity,
                y: sprite.offSet.y + sprite.direction.yDelta * sprite.velocity)
    }
    
}
