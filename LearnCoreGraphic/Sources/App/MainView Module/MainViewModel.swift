//
//  MainViewModel.swift
//  LearnCoreGraphic
//
//  Created by Lauriane Haydari on 10/04/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

final class MainViewModel {

    // MARK: - Properties

    // MARK: - Output

    var rectangleButtonText: ((String) -> Void)?

    var filledRectangleButtonText: ((String) -> Void)?

    var circleButtonText: ((String) -> Void)?

    var filledCircleButtonText: ((String) -> Void)?

    var triangleButtonText: ((String) -> Void)?

    var filledTriangleButtonText: ((String) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
        rectangleButtonText?("DRAW RECTANGLE")
        filledRectangleButtonText?("FILLED RECTANGLE")
        circleButtonText?("DRAW CIRCLE")
        filledCircleButtonText?("FILLED CIRCLE")
        triangleButtonText?("DRAW TRIANGLE")
        filledTriangleButtonText?("FILLED TRIANGLE")
    }

    func didPressDrawCircle() {
        
    }

    func didPressDrawTriangle() {

    }
}
