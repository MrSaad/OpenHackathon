//
//  MapsContentViewController.swift
//  OpenHackathon
//
//  Created by Saad Ahmed on 2015-09-01.
//  Copyright (c) 2015 Saad Ahmed. All rights reserved.
//

import UIKit

class MapsContentViewController: UIViewController {

    //labels
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    //information
    var pageIndex: Int!
    var titleText: String!
    var imageFile: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = UIImage(named: self.imageFile)
        self.titleLabel.text = self.titleText
        
        //set tap gestures on images
        imageView.userInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: "imageTapped:")
        tapGesture.numberOfTapsRequired = 1
        imageView.addGestureRecognizer(tapGesture)
    }

    func imageTapped(tapGesture: UITapGestureRecognizer) {
        let infoImage = JTSImageInfo()
        infoImage.image = imageView.image!
        infoImage.referenceRect = imageView.frame
        infoImage.referenceView = imageView.superview
        let imageViewController = JTSImageViewController(imageInfo: infoImage, mode: JTSImageViewControllerMode.Image, backgroundStyle: JTSImageViewControllerBackgroundOptions.Scaled)
        imageViewController.showFromViewController(self, transition: JTSImageViewControllerTransition.FromOriginalPosition)
    }
    

}
