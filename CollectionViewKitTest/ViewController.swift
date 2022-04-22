//
//  ViewController.swift
//  CollectionViewKitTest
//
//  Created by difine on 2022/04/21.
//

import UIKit

import CollectionKit
import SnapKit

class ViewController: UIViewController {
    
    let collectionView = CollectionView()

    @IBOutlet weak var BackGroundView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
        setCollectionView()
    }
    
    private func setCollectionView() {
        BackGroundView.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalToSuperview().offset(14)
        }
        
        let dataSource = ArrayDataSource(data: Array(1...10))
        let viewSource = ClosureViewSource(viewUpdater: { (view: UILabel, data: Int, index: Int) in
                
            view.backgroundColor = .systemBlue
            view.text = "\(data)"
            view.textAlignment = .center
            view.clipsToBounds = true
            view.layer.cornerRadius = 5
            view.gestureRecognizers = [UIGestureRecognizer(target: self, action: #selector(self.cellDidTapped))]
        })
        let sizeSource = { (index: Int, data: Int, collectionSize: CGSize) -> CGSize in
          return CGSize(width: 50, height: 50)
        }
        let provider = BasicProvider(
          dataSource: dataSource,
          viewSource: viewSource,
          sizeSource: sizeSource
        )
        
        provider.layout = FlowLayout(spacing: 10)

        //lastly assign this provider to the collectionView to display the content
        collectionView.provider = provider
    }
    
    private func setUI() {
        addButton.clipsToBounds = true
        addButton.layer.cornerRadius = 10
        
        deleteButton.clipsToBounds = true
        deleteButton.layer.cornerRadius = 10
    }
    
    @objc func cellDidTapped() {
        print(#function)
    }


    @IBAction func addButtonTapped(_ sender: UIButton) {
        print(#function)
    }
}


    
    
