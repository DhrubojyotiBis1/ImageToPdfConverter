//
//  PdfViewController.swift
//  ImageToPdfConverter
//
//  Created by Dhrubojyoti on 10/06/19.
//  Copyright © 2019 Dhrubojyoti. All rights reserved.
//

import UIKit

class PdfViewController: UIViewController {
    
    var pdfPath = ""

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView.loadRequest(NSURLRequest(url: NSURL(string: pdfPath)! as URL) as URLRequest)    }

}
