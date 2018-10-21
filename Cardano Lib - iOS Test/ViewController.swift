//
//  ViewController.swift
//  Cardano Lib - iOS Test
//
//  Created by HM on 21/10/2018.
//  Copyright © 2018 Lambo Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var encodeLabel: UILabel!
    @IBOutlet weak var decodeLabel: UILabel!
    
    @IBOutlet weak var encodeText: UITextField!
    @IBOutlet weak var decodeText: UITextField!
    
    func alert( msg: String ) {
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func encodeButton(_ sender: UIButton) {
        if let str: String = encodeText.text {
            let encoded = CardanoFuncs.encode(stringToEncode: str)
            alert(msg: encoded)
        }
    }
    
    @IBAction func decodeButton(_ sender: UIButton) {
        if let str: String = decodeText.text {
            let decoded = CardanoFuncs.decode(stringToDecode: str)
            alert(msg: decoded)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

