//
//  ViewController.swift
//  Demo
//
//  Created by Suguru Kishimoto on 2016/01/31.
//
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc @IBAction private func showPhotoSelect(sender: AnyObject!) {
        let storyboard = UIStoryboard(name: "SamplePhotoSelectVC", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! SamplePhotoSelectVC
        presentViewController(vc, animated: true, completion: nil)
    }

}

