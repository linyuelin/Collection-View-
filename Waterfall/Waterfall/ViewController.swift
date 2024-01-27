//
//  ViewController.swift
//  Waterfall
//
//  Created by dreaMTank on 2024/01/27.
//

import UIKit
import CHTCollectionViewWaterfallLayout

class ViewController: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource , CHTCollectionViewDelegateWaterfallLayout {

    private var collectionView : UICollectionView = {
        let layout = CHTCollectionViewWaterfallLayout()
        layout.itemRenderDirection = .leftToRight // 左から右へとレンダリングします
        layout.columnCount = 2 // 2列
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        return collectionView
    }()
    
    struct Model {
        let imageName: String
        let height: CGFloat
    }
    
    private var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let images = Array(1...9).map {"image\($0)"}
        
         models = images.compactMap {
           return Model.init(imageName: $0, height: CGFloat.random(in: 300...600))
        }
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {
            fatalError()
        }
        cell.configure(image: UIImage(named: models[indexPath.row].imageName))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.size.width / 2, height: models[indexPath.row].height)
    }


}

