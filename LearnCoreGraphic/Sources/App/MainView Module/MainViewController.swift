//
//  ViewController.swift
//  LearnCoreGraphic
//
//  Created by Lauriane Haydari on 10/04/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Outlets


    @IBOutlet weak var rectangleButton: UIButton!

    @IBOutlet weak var filledRectangleButton: UIButton!

    @IBOutlet weak var circleButton: UIButton!

    @IBOutlet weak var filledCircleButton: UIButton!

    @IBOutlet weak var triangleButton: UIButton!

    @IBOutlet weak var filledTriangleButton: UIButton!

    @IBOutlet weak var drawView: DrawView!

    private let viewModel = MainViewModel()

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        bind(to: viewModel)

        viewModel.viewDidLoad()
    }

    // MARK: - View actions

    // Rectangle

    @IBAction func didPressDrawRectangle(_ sender: Any) {
        drawView.drawShape(selectedShape: .rectangle)
    }

    @IBAction func didPressDrawFilledRectangle(_ sender: Any) {
        drawView.drawShape(selectedShape: .filledRectangle)
    }

    // Circle

    @IBAction func didPressDrawCircle(_ sender: Any) {
        drawView.drawShape(selectedShape: .circle)
    }

    @IBAction func didPressDrawFilledCircle(_ sender: Any) {
        drawView.drawShape(selectedShape: .filledCircle)
    }

    // Triangle

    @IBAction func didPressDrawTriangle(_ sender: Any) {
        drawView.drawShape(selectedShape: .triangle)
    }

    @IBAction func didPressDrawFilledTriangle(_ sender: Any) {
        drawView.drawShape(selectedShape: .filledTriangle)
    }

    // MARK: - Private Functions

    private func bind(to viewModel: MainViewModel) {
        viewModel.rectangleButtonText = { [weak self] text in
            self?.rectangleButton.setTitle(text, for: .normal)
        }
        viewModel.filledRectangleButtonText = { [weak self] text in
            self?.filledRectangleButton.setTitle(text, for: .normal)
        }
        viewModel.circleButtonText = { [weak self] text in
            self?.circleButton.setTitle(text, for: .normal)
        }
        viewModel.filledCircleButtonText = { [weak self] text in
            self?.filledCircleButton.setTitle(text, for: .normal)
        }
        viewModel.triangleButtonText = { [weak self] text in
            self?.triangleButton.setTitle(text, for: .normal)
        }
        viewModel.filledTriangleButtonText = { [weak self] text in
            self?.filledTriangleButton.setTitle(text, for: .normal)
        }
    }
}

