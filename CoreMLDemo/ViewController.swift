//
//  ViewController.swift
//  CoreMLDemo
//
//  Created by admin on 3/20/20.
//  Copyright © 2020 Kingsley. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var imageView = UIImageView()
    var classifierLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupView()
    }
    
    fileprivate func setupNavBar() {
        let leftBarItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(cameraTapped))
        let rightBarItem = UIBarButtonItem(title: "Library", style: .plain, target: self, action: #selector(libraryTapped))
        navigationItem.leftBarButtonItem = leftBarItem
        navigationItem.rightBarButtonItem = rightBarItem
    }
    
    fileprivate func setupView() {
        view.backgroundColor = .green
        imageView.backgroundColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        classifierLabel.text = "nani"
        classifierLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        view.addSubview(classifierLabel)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            classifierLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            classifierLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50)
        ])
    }

    @objc func cameraTapped() {
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            return
        }
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .camera
        cameraPicker.allowsEditing = false
        present(cameraPicker, animated: true)
    }
    
    @objc func libraryTapped() {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }

}

