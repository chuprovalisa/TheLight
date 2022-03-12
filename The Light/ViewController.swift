//
//  ViewController.swift
//  The Light
//
//  Created by Елизавета Чупрова on 11.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var isLightColor = 0
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    fileprivate func updateUI() {
        
        switch isLightColor {
        case 0: view.backgroundColor = .red
        case 1: view.backgroundColor = .yellow
        case 2: view.backgroundColor = .green
        default:
            print("Error")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isLightColor = isLightColor < 2 ? isLightColor + 1 : 0
        updateUI()
    }
}

//Turn on flashlight


