//
//  SegmentControlViewController.swift
//  CollectionViewKitTest
//
//  Created by difine on 2022/04/22.
//

import UIKit

class SegmentControlViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            imageView.image = UIImage(systemName: "star")
        case 1:
            imageView.image = UIImage(systemName: "heart")
            
        default:
            imageView.image = UIImage(systemName: "star")
        }
    }
    
}
