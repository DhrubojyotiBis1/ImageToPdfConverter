//
//  ViewController.swift
//  ImageToPdfConverter
//
//  Created by Dhrubojyoti on 10/06/19.
//  Copyright © 2019 Dhrubojyoti. All rights reserved.
//

import UIKit
import ImagePicker

class ViewController: UIViewController,ImagePickerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showOptionForImage()
    }
    
    
    private func showOptionForImage(){
        let alert = UIAlertController(title: "Image import option", message: "select the type to option fit for importing image", preferredStyle: .actionSheet)
        
        let  photoLibrary = UIAlertAction(title: "Photo library", style: .default) { (UIAlertAction) in
            let imagePickerController = ImagePickerController()
            imagePickerController.delegate = self
            self.present(imagePickerController, animated: true, completion: nil)
        }
        
        let  camera = UIAlertAction(title: "Camera", style: .default) { (UIAlertAction) in
            print("NO PHONE")
        }
        alert.addAction(photoLibrary)
        alert.addAction(camera)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        print(images.count)
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }



}

