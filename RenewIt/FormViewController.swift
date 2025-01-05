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
    private var interestSegmentedControl: UISegmentedControl!
    private var experienceSlider: UISlider!
    private var experienceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.8, green: 0.95, blue: 0.8, alpha: 1.0)
        setupUI()
    }

    private func setupUI() {
        // Name Field
        let nameLabel = createLabel(text: "Enter your name:")
        nameField = createTextField()

        // Goal Stepper
        let goalDescriptionLabel = createLabel(text: "Weekly Upcycle Goal:")
        goalStepper = UIStepper()
        goalStepper.minimumValue = 1
        goalStepper.maximumValue = 100
        goalStepper.value = 10
        goalStepper.addTarget(self, action: #selector(updateGoalLabel), for: .valueChanged)
        goalStepper.translatesAutoresizingMaskIntoConstraints = false

        goalLabel = createLabel(text: "Goal: 10")

        // Interest in Upcycling
        let interestLabel = createLabel(text: "Interest in Upcycling:")
        interestSegmentedControl = UISegmentedControl(items: ["Low", "Medium", "High"])
        interestSegmentedControl.selectedSegmentIndex = 1
        interestSegmentedControl.translatesAutoresizingMaskIntoConstraints = false

        // Upcycling Experience
        var experienceLabel = createLabel(text: "Upcycling Experience:")
        experienceSlider = UISlider()
        experienceSlider.minimumValue = 0
        experienceSlider.maximumValue = 10
        experienceSlider.value = 5
        experienceSlider.addTarget(self, action: #selector(updateExperienceLabel), for: .valueChanged)
        experienceSlider.translatesAutoresizingMaskIntoConstraints = false

        experienceLabel = createLabel(text: "Experience: 5")

        // Submit Button
        let submitButton = UIButton(type: .system)
        submitButton.setTitle("Start Upcycling!", for: .normal)
        submitButton.backgroundColor = .systemGreen
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.layer.cornerRadius = 10
        submitButton.addTarget(self, action: #selector(submitForm), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false

        [nameLabel, nameField, goalDescriptionLabel, goalStepper, goalLabel,
         interestLabel, interestSegmentedControl, experienceLabel, experienceSlider,
         self.experienceLabel, submitButton].forEach { view.addSubview($0) }

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

            interestLabel.topAnchor.constraint(equalTo: goalStepper.bottomAnchor, constant: 20),
            interestLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            interestSegmentedControl.topAnchor.constraint(equalTo: interestLabel.bottomAnchor, constant: 10),
            interestSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            interestSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            experienceLabel.topAnchor.constraint(equalTo: interestSegmentedControl.bottomAnchor, constant: 20),
            experienceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            experienceSlider.topAnchor.constraint(equalTo: experienceLabel.bottomAnchor, constant: 10),
            experienceSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            experienceSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            self.experienceLabel.topAnchor.constraint(equalTo: experienceSlider.bottomAnchor, constant: 10),
            self.experienceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            submitButton.topAnchor.constraint(equalTo: self.experienceLabel.bottomAnchor, constant: 30),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.widthAnchor.constraint(equalToConstant: 200),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .darkGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    private func createTextField() -> UITextField {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }

    @objc private func updateGoalLabel() {
        goalLabel.text = "Goal: \(Int(goalStepper.value))"
    }

    @objc private func updateExperienceLabel() {
        experienceLabel.text = "Experience: \(Int(experienceSlider.value))"
    }

    @objc private func submitForm() {
        let viewController = ViewController()
        viewController.name = nameField.text ?? "User"
        viewController.goal = Int(goalStepper.value)
        viewController.interest = interestSegmentedControl.selectedSegmentIndex
        viewController.experience = Int(experienceSlider.value)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension UIColor {
    static let darkGreen = UIColor(red: 0, green: 0.5, blue: 0, alpha: 1.0)
}
