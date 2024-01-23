//
//  ViewController.swift
//  StoriesCollectionView
//
//  Created by dreaMTank on 2024/01/23.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource {
   
    
     
    private var collectionView: UICollectionView?
    
    private let  cars=["car1","car2","car3","car4","car1","car2","car3","car4","car1","car2","car3","car4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(CircleCollectionViewCell.self, forCellWithReuseIdentifier: CircleCollectionViewCell.identifier)
        guard let myCollection = collectionView else {
            return
        }
        
        view.addSubview(myCollection)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 150).integral
        
    }   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleCollectionViewCell.identifier, for: indexPath) as! CircleCollectionViewCell
        
        cell.configure(with: cars[indexPath.row])
        
        
        return cell
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
    }
    
    
}

