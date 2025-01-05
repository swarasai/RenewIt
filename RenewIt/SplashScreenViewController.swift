//
//  SplashScreenViewController.swift
//  RenewIt
//
//  Created by Swarasai Mulagari on 1/5/25.
//

import UIKit

class SplashScreenViewController: UIViewController {

    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "splashscreen"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLogoImageView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateLogoAndTransition()
    }

    private func setupLogoImageView() {
        view.addSubview(logoImageView)

        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor)
        ])
    }

    private func animateLogoAndTransition() {
        UIView.animate(withDuration: 1.5, delay: 0.5, options: .curveEaseInOut, animations: {
            self.logoImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { _ in
            UIView.animate(withDuration: 0.5, animations: {
                self.logoImageView.alpha = 0
            }) { _ in
                // Navigate to FormViewController
                let formVC = FormViewController()
                self.navigationController?.pushViewController(formVC, animated: true)
            }
        }
    }
}
