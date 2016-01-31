//
//  SamplePhotoSelectVC.swift
//  Demo
//
//  Created by Suguru Kishimoto on 2016/01/31.
//
//

import UIKit

class SamplePhotoSelectVC: UIViewController {
    
    @IBOutlet private weak var closeButton: UIButton!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var rowLabel: UILabel!
    @IBOutlet private weak var rowStepper: UIStepper!
    @IBOutlet private weak var spaceLabel: UILabel!
    @IBOutlet private weak var spaceStepper: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.registerNib(
            UINib(nibName: "PhotoSelectCell", bundle: nil),
            forCellWithReuseIdentifier: "PhotoSelectCell"
        )
        collectionView.dataSource = self
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layoutIfNeeded()
        updateCollectionViewLayout()
    }
    
    func updateCollectionViewLayout() {
        let isLandscape = UIDeviceOrientationIsLandscape(UIDevice.currentDevice().orientation)
        let row = Int(rowStepper.value) + (isLandscape ? 2 : 0)
        collectionView.adaptBeautifulGrid(
            row,
            gridLineSpace: CGFloat(spaceStepper.value),
            sectionInset: UIEdgeInsetsMake(0, 10, 0, 10))
    }
    func updateLabels() {
        rowLabel.text = "\(rowStepper.value)"
        spaceLabel.text = "\(spaceStepper.value)"
    }
    
    @objc @IBAction private func close(sender: AnyObject!) {
        dismissViewControllerAnimated(true, completion: nil);
    }

    @objc @IBAction private func step(sender: AnyObject!) {
        updateLabels()
        updateCollectionViewLayout()
    }
    
}

extension SamplePhotoSelectVC: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 300
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PhotoSelectCell", forIndexPath: indexPath) as! PhotoSelectCell
        cell.configure("samplePhoto_\(indexPath.item % 4).png")
        cell.backgroundColor = UIColor(
            hue: CGFloat(arc4random_uniform(100)) / CGFloat(100.0),
            saturation: CGFloat(arc4random_uniform(100)) / CGFloat(100.0),
            brightness: CGFloat(arc4random_uniform(100)) / CGFloat(100.0),
            alpha: 1.0
        )
        return cell
    }
}