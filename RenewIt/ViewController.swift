//
//  ViewController.swift
//  RenewIt
//
//  Created by Swarasai Mulagari on 1/5/25.
//

import UIKit

class ViewController: UIViewController {

    var name: String = ""
    var goal: Int = 0
    var progress: Int = 0
    var analyzedItems: [String: Int] = [
        "battery": 0, "biological": 0, "cardboard": 0, "clothes": 0,
        "glass": 0, "metal": 0, "paper": 0, "plastic": 0, "shoes": 0, "trash": 0
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    func setupUI() {
        // Welcome Message
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome, \(name)!"
        welcomeLabel.font = .boldSystemFont(ofSize: 24)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLabel)

        // Progress Bar
        let progressBar = UIProgressView(progressViewStyle: .default)
        progressBar.progress = Float(progress) / Float(goal)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressBar)

        // Camera and Upcycling Buttons
        let cameraButton = UIButton(type: .system)
        cameraButton.setTitle("Open Camera", for: .normal)
        cameraButton.addTarget(self, action: #selector(openCamera), for: .touchUpInside)
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cameraButton)

        let upcyclingButton = UIButton(type: .system)
        upcyclingButton.setTitle("Upcycling Advice", for: .normal)
        upcyclingButton.addTarget(self, action: #selector(showUpcyclingAdvice), for: .touchUpInside)
        upcyclingButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(upcyclingButton)

        // Constraints
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            progressBar.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            cameraButton.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 40),
            cameraButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            upcyclingButton.topAnchor.constraint(equalTo: cameraButton.bottomAnchor, constant: 20),
            upcyclingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc func openCamera() {
        let cameraVC = CameraViewController()
        cameraVC.delegate = self
        navigationController?.pushViewController(cameraVC, animated: true)
    }

    @objc func showUpcyclingAdvice() {
        let adviceVC = UpcyclingAdviceViewController()
        adviceVC.analyzedItems = analyzedItems
        navigationController?.pushViewController(adviceVC, animated: true)
    }
}

extension ViewController: CameraDelegate {
    func didAnalyzeItem(category: String) {
        analyzedItems[category, default: 0] += 1
        progress += 1
        view.setNeedsLayout()
    }
}

