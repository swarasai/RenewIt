//
//  CameraViewController.swift
//  RenewIt
//
//  Created by Swarasai Mulagari on 1/5/25.
//

import UIKit
import CoreML
import Vision

protocol CameraDelegate: AnyObject {
    func didAnalyzeItem(category: String)
}

class CameraViewController: UIViewController {

    weak var delegate: CameraDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        let captureButton = UIButton(type: .system)
        captureButton.setTitle("Capture and Analyze", for: .normal)
        captureButton.addTarget(self, action: #selector(analyzePhoto), for: .touchUpInside)
        captureButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(captureButton)

        NSLayoutConstraint.activate([
            captureButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            captureButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func analyzePhoto() {
        // Mock Analysis Logic
        // Replace this with actual photo analysis using your CoreML model (wasteClassification1).
        let categories = ["battery", "biological", "cardboard", "clothes", "glass", "metal", "paper", "plastic", "shoes", "trash"]
        let randomCategory = categories.randomElement()!

        // Notify delegate
        delegate?.didAnalyzeItem(category: randomCategory)

        // Dismiss or go back
        navigationController?.popViewController(animated: true)
    }
}
