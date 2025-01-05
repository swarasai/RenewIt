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

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    weak var delegate: CameraDelegate?
    private var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        let captureButton = UIButton(type: .system)
        captureButton.setTitle("Capture and Analyze", for: .normal)
        captureButton.addTarget(self, action: #selector(captureImage), for: .touchUpInside)
        captureButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(captureButton)

        NSLayoutConstraint.activate([
            captureButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            captureButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func captureImage() {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        dismiss(animated: true) {
            self.analyzePhoto(image)
        }
    }

    private func analyzePhoto(_ image: UIImage) {
        guard let model = try? VNCoreMLModel(for: wasteClassification_1().model) else {
            print("Failed to load ML model")
            return
        }

        let request = VNCoreMLRequest(model: model) { [weak self] request, error in
            guard let results = request.results as? [VNClassificationObservation] else { return }
            if let topResult = results.first {
                DispatchQueue.main.async {
                    self?.delegate?.didAnalyzeItem(category: topResult.identifier)
                    self?.navigationController?.popViewController(animated: true)
                }
            }
        }

        guard let ciImage = CIImage(image: image) else { return }
        let handler = VNImageRequestHandler(ciImage: ciImage, orientation: .up)
        do {
            try handler.perform([request])
        } catch {
            print("Failed to perform classification: \(error)")
        }
    }
}
