//
//  FormViewController.swift
//  RenewIt
//
//  Created by Swarasai Mulagari on 1/5/25.
//

import UIKit

class FormViewController: UIViewController {

    private var nameField: UITextField!
    private var goalStepper: UIStepper!
    private var goalLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        // Name Field
        let nameLabel = UILabel()
        nameLabel.text = "Enter your name:"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)

        nameField = UITextField()
        nameField.borderStyle = .roundedRect
        nameField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameField)

        // Goal Stepper
        let goalDescriptionLabel = UILabel()
        goalDescriptionLabel.text = "Weekly Upcycle Goal:"
        goalDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(goalDescriptionLabel)

        goalStepper = UIStepper()
        goalStepper.minimumValue = 1
        goalStepper.maximumValue = 100
        goalStepper.value = 10
        goalStepper.addTarget(self, action: #selector(updateGoalLabel), for: .valueChanged)
        goalStepper.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(goalStepper)

        goalLabel = UILabel()
        goalLabel.text = "Goal: 10"
        goalLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(goalLabel)

        // Submit Button
        let submitButton = UIButton(type: .system)
        submitButton.setTitle("Submit", for: .normal)
        submitButton.addTarget(self, action: #selector(submitForm), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(submitButton)

        // Constraints
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            nameField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            goalDescriptionLabel.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20),
            goalDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            goalStepper.topAnchor.constraint(equalTo: goalDescriptionLabel.bottomAnchor, constant: 10),
            goalStepper.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            goalLabel.centerYAnchor.constraint(equalTo: goalStepper.centerYAnchor),
            goalLabel.leadingAnchor.constraint(equalTo: goalStepper.trailingAnchor, constant: 10),

            submitButton.topAnchor.constraint(equalTo: goalStepper.bottomAnchor, constant: 30),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func updateGoalLabel() {
        goalLabel.text = "Goal: \(Int(goalStepper.value))"
    }

    @objc private func submitForm() {
        let viewController = ViewController() // This is the dashboard
        viewController.name = nameField.text ?? "User"
        viewController.goal = Int(goalStepper.value)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
