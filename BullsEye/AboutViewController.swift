//
//  AboutViewController.swift
//  BullsEye
//
//  Created by My3 Shenoy on 28/12/17.
//  Copyright © 2017 com.aarven. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Read the html data
        if let url = Bundle.main.url(forResource: "BullsEye",
                                     withExtension: "html") {
            if let htmlData = try? Data(contentsOf: url) {
                let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
                webView.load(htmlData, mimeType: "text/html",textEncodingName: "UTF-8",
                             baseURL: baseURL)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
    

}
