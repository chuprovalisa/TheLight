//
//  ViewController.swift
//  The Light
//
//  Created by Елизавета Чупрова on 11.03.2022.
//

import UIKit
import AVFoundation

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
        updateView(on: true)
    }
}

//Turn on flashlight

func updateView(on: Bool) {
    guard let device = AVCaptureDevice.default(for: .video)
    else { return }
    
    if device.hasTorch {
        do {
            try device.lockForConfiguration()
            
            if on == true {
                device.torchMode = .on
            } else {
                device.torchMode = .off
            }
            
            device.unlockForConfiguration()
        } catch {
            print("It is not possible to use")
        }
        
    } else {
        print("Not available")
    }
}
