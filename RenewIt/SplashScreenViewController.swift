//
//  SplashScreenViewController.swift
//  RenewIt
//
//  Created by Swarasai Mulagari on 1/5/25.
//

import UIKit

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        showLogo()
    }

    private func showLogo() {
        let logo = UIImageView(image: UIImage(named: "RenewItLogo"))
        logo.contentMode = .scaleAspectFit
        logo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logo)

        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logo.widthAnchor.constraint(equalToConstant: 200),
            logo.heightAnchor.constraint(equalToConstant: 200)
        ])

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let formVC = FormViewController()
            self.navigationController?.pushViewController(formVC, animated: true)
        }
    }
}
