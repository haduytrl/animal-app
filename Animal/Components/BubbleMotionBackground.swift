//
//  BubbleMotionView.swift
//  Animal
//
//  Created by Duy Ha on 23/10/24.
//

import SwiftUI

public struct BubbleMotionBackground: View {
    // MARK: Properties
    
    var size: CGFloat { CGFloat.random(in: 10...300) }
    
    var scaleEffect: CGFloat { CGFloat.random(in: 0.1...2.0) }
    
    var speed: Double { Double.random(in: 0.25...1.0) }
    
    var delay: Double { Double.random(in: 0.5...2) }
    
    // MARK: State
    
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    // MARK: Body
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { _ in
                    Circle()
                        .foregroundStyle(.gray.opacity(0.15))
                        .frame(width: size, height: size, alignment: .center)
                        .scaleEffect(isAnimating ? scaleEffect : 1)
                        .position(.init(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        ))
                        .animation(
                            .interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                            .speed(speed)
                            .delay(delay),
                            value: isAnimating
                        )
                        .onAppear {
                            isAnimating = true
                        }
                } //: ForEach
            } //: ZStack
            .drawingGroup()
        } //: GeometryReader
    }
}

private extension BubbleMotionBackground {
    func randomCoordinate(max: CGFloat) -> CGFloat { CGFloat.random(in: 1...max) }
}

#Preview {
    BubbleMotionBackground()
}
