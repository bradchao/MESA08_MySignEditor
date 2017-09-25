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

    @IBAction func doClear(_ sender: Any) {
        myView.clear()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

