//
//  ViewController.swift
//  MySignEditor
//
//  Created by user22 on 2017/9/25.
//  Copyright © 2017年 Brad Big Company. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myView: MyView!

    
    @IBAction func saveMyView(_ sender: Any) {
        let img =  UIImage.init(view: myView)
        
        print(NSHomeDirectory())
        let imgFile = NSHomeDirectory() + "/Documents/brad.jpg"
        let imgUrl = URL(fileURLWithPath: imgFile)
        let imgData = UIImageJPEGRepresentation(img, 1)
        do {
            try imgData?.write(to: imgUrl)
            print("Save OK")
        }catch{
            print("Save Failure")
        }
    }
    
    @IBAction func doClear(_ sender: Any) {
        myView.clear()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension UIImage{
    convenience init(view: UIView) {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: false)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (image?.cgImage)!)
        
    }
}




