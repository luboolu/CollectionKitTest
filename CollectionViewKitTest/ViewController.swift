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
    var myData = ArrayDataSource(data: Array(1...10))

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
        
        let dataSource = myData
        let viewSource = ClosureViewSource(viewUpdater: { (view: UILabel, data: Int, index: Int) in

            let r : CGFloat = CGFloat.random(in: 0.5...0.9)
            let g : CGFloat = CGFloat.random(in: 0.5...0.9)
            let b : CGFloat = CGFloat.random(in: 0.5...0.9)
            
            view.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
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
        
        provider.layout = FlowLayout(spacing: 10, justifyContent: .center, alignItems: .center, alignContent: .start)

        //lastly assign this provider to the collectionView to display the content
        collectionView.provider = provider
    }
    
    private func setUI() {
        addButton.clipsToBounds = true
        addButton.layer.cornerRadius = 10
        addButton.layer.shadowColor = UIColor.black.cgColor
        addButton.layer.masksToBounds = false
        addButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        addButton.layer.shadowRadius = 5
        addButton.layer.shadowOpacity = 0.3
        
        deleteButton.clipsToBounds = true
        deleteButton.layer.cornerRadius = 10
        deleteButton.layer.shadowColor = UIColor.black.cgColor
        deleteButton.layer.masksToBounds = false
        deleteButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        deleteButton.layer.shadowRadius = 5
        deleteButton.layer.shadowOpacity = 0.3
    }
    
    @objc func cellDidTapped() {
        print(#function)
    }


    @IBAction func addButtonTapped(_ sender: UIButton) {
        print(#function)
        myData.data.append(contentsOf: [myData.data.last! + 1])
    }
    
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        print(#function)
        myData.data.removeLast()
    }
}


    
    
