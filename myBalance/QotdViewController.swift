//
//  QotdViewController.swift
//  myBalance
//
//  Created by Andrew Mogg on 10/29/17.
//  Copyright © 2017 Andrew Mogg. All rights reserved.
//

import UIKit

class QotdViewController: UIViewController {

    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    public var author = ""
    public var quote = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authorLabel.text = author
        quoteLabel.text = quote

//        QotdResourceService.getQuoteOfDay() { (success, quote, error) in
//            if (success)
//            {
//                self.text = quote.author
//                self.quoteLabel.text = quote.quoteText
//                print(quote.quoteText)
//
//            }
//            else{
//                print(error)
//            }
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
