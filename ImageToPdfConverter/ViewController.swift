//
//  ViewController.swift
//  ImageToPdfConverter
//
//  Created by Dhrubojyoti on 10/06/19.
//  Copyright © 2019 Dhrubojyoti. All rights reserved.
//

import UIKit
import ImagePicker
import PDFGenerator

class ViewController: UIViewController,ImagePickerDelegate {
    fileprivate var outputAsData: Bool = false
    var path = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showOptionForImage()
    }
    
    fileprivate func getDestinationPath(_ number: Int) -> String {
        return NSHomeDirectory() + "/sample\(number).pdf"
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
        self.generatePdfFromImage(withImages: images)
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    private func generatePdfFromImage(withImages images: [UIImage]){
        print("YES")
        path = getDestinationPath(2)
        autoreleasepool {
            do {
                if outputAsData {
                    let data = try PDFGenerator.generated(by: images)
                    try data.write(to: URL(fileURLWithPath: self.path))
                } else {
                    try PDFGenerator.generate(images, to: self.path, dpi: .custom(144), password: "123456")
                }
                
                print(path)
                performSegue(withIdentifier: "goToPdfDisplay", sender: nil)
                //openPDFViewer(dst)
            } catch let e {
                print(e)
            }
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPdfDisplay"{
            let pdfVC = segue.destination as! PdfViewController
            pdfVC.pdfPath = self.path
        }
    }

}

