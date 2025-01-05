//
//  UpcyclingAdviceViewController.swift
//  RenewIt
//
//  Created by Swarasai Mulagari on 1/5/25.
//

import UIKit

class UpcyclingAdviceViewController: UIViewController {

    var analyzedItems: [String: Int] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        let adviceLabel = UILabel()
        adviceLabel.text = generateAdvice()
        adviceLabel.numberOfLines = 0
        adviceLabel.textAlignment = .center
        adviceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(adviceLabel)

        NSLayoutConstraint.activate([
            adviceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            adviceLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            adviceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            adviceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func generateAdvice() -> String {
        var adviceText = "Upcycling Advice:\n"
        for (category, count) in analyzedItems where count > 0 {
            adviceText += "\(count) \(category): Try reusing or creatively repurposing these items.\n"
        }
        return adviceText.isEmpty ? "No items analyzed yet!" : adviceText
    }
}
