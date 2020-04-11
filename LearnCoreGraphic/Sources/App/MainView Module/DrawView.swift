//
//  DrawView.swift
//  LearnCoreGraphic
//
//  Created by Lauriane Haydari on 10/04/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

enum Shape {
    case rectangle
    case filledRectangle
    case circle
    case filledCircle
    case triangle
    case filledTriangle
}

class DrawView: UIView {

    // MARK: - Properties

    var currentShape: Shape?

    // MARK: - View life cycle

    override func draw(_ rect: CGRect) {
        print("The draw method has been called")

        guard let currentContext = UIGraphicsGetCurrentContext() else {
            print("Could not get the context")
            return
        }
        drawShapes(currentContext)
    }

    func drawShape(selectedShape: Shape) {
        currentShape = selectedShape
        setNeedsDisplay()
    }

    // MARK: - Private Functions

    fileprivate func drawShapes(_ currentContext: CGContext) {
        switch currentShape {
        case .rectangle:
            drawRectangle(user: currentContext, isFilled: false)
        case .filledRectangle:
            drawRectangle(user: currentContext, isFilled: true)
        case .circle:
            drawCircle(user: currentContext, isFilled: false)
        case .filledCircle:
            drawCircle(user: currentContext, isFilled: true)
        case .triangle:
            drawTriangle(user: currentContext, isFilled: false)
        case .filledTriangle:
            drawTriangle(user: currentContext, isFilled: true)
        default:
            break
        }
    }

    private func drawRectangle(user context: CGContext, isFilled: Bool) {

        let strokeDistance: CGFloat = 75
        let centerPoint = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        let lowerLeftCorner = CGPoint(x: centerPoint.x - strokeDistance, y: centerPoint.y + strokeDistance)
        let lowerRightCorner = CGPoint(x: centerPoint.x + strokeDistance, y: centerPoint.y + strokeDistance)
        let upperLeftCorner = CGPoint(x: centerPoint.x - strokeDistance, y: centerPoint.y - strokeDistance)
        let upperRightCorner = CGPoint(x: centerPoint.x + strokeDistance, y: centerPoint.y - strokeDistance)

        context.move(to: lowerLeftCorner)
        context.addLine(to: lowerRightCorner)
        context.addLine(to: upperRightCorner)
        context.addLine(to: upperLeftCorner)
        context.addLine(to: lowerLeftCorner)

        context.setLineCap(.square)
        context.setLineWidth(8.0)

        if isFilled {
            context.setFillColor(UIColor.purple.cgColor)
            context.fillPath()
        } else {
            context.setStrokeColor(UIColor.yellow.cgColor)
            context.strokePath()
        }
    }

    private func drawCircle(user context: CGContext, isFilled: Bool) {
        let centerPoint = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        context.addArc(center: centerPoint, radius: 90, startAngle: CGFloat(0).degreesToRadians, endAngle: CGFloat(360).degreesToRadians, clockwise: true)
        context.setLineWidth(7.0)

        if isFilled {
            context.setFillColor(UIColor.purple.cgColor)
            context.fillPath()
        } else {
            context.setStrokeColor(UIColor.systemPink.cgColor)
            context.strokePath()
        }
    }

    private func drawTriangle(user context: CGContext, isFilled: Bool) {

        let strokeDistance: CGFloat = 75
        let centerPoint = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        let lowerLeftCorner = CGPoint(x: centerPoint.x - strokeDistance, y: centerPoint.y + strokeDistance)
        let lowerRightCorner = CGPoint(x: centerPoint.x + strokeDistance, y: centerPoint.y + strokeDistance)
        let upperCorner = CGPoint(x: centerPoint.x + strokeDistance, y: centerPoint.y - strokeDistance)
        
        context.move(to: lowerLeftCorner)
        context.addLine(to: lowerRightCorner)
        context.addLine(to: upperCorner)
        context.addLine(to: lowerLeftCorner)

        context.setLineCap(.square)
        context.setLineWidth(7.0)

        if isFilled {
            context.setFillColor(UIColor.purple.cgColor)
            context.fillPath()
        } else {
            context.setStrokeColor(UIColor.orange.cgColor)
            context.strokePath()
        }
    }
}

extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
}
