//
//  MapViewController.swift
//  PrototypeTwo
//
//  Created by Natalie Peters on 4/11/17.
//  Copyright © 2017 Natalie Peters. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

}
