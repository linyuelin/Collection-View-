//
//  ViewController.swift
//  CollectionCompositeLayout
//
//  Created by dreaMTank on 2024/01/25.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDataSource {
    
   
    
    
    private let collectionView =  UICollectionView (
       frame: .zero,
       collectionViewLayout: ViewController.createLayout()
    )
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
       
    }
    
   static func createLayout() -> UICollectionViewCompositionalLayout {
         // アイテムの定義：　基本的なアイテム、幅の２/3を占め、高さは全体
       let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(2/3), heightDimension: .fractionalHeight(1)))
        //余白設定
       item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
       
         //垂直スタックのアイテム、高さは幅の半分
       let verticalStackItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)))
       verticalStackItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
      
          //垂直スタックのグループ、verticalStackItem二つ含む、幅の１/3と全体の高さ
       let verticalStackGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)) , subitem: verticalStackItem, count: 2)
       // 三つ組のアイテム、
       let tripletItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1)))
       
       tripletItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
       
       
       //Group
       // 三つの水平グループ、tripletItemを3つ含む、全体の幅と幅の30%
       let tripletHorizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.3)), subitem: tripletItem, count: 3 )
       
       
       // 水平グループ、itemとverticalStackGroupを含む
       let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.7)), subitems: [ item , verticalStackGroup ] )
                 
       // 垂直グループ、horizontalGroupとtripletHorizontalGroupを含む
       let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)), subitems: [  horizontalGroup ,tripletHorizontalGroup
       ])
       
       // セクションの定義、verticalGroupを含む
       let section = NSCollectionLayoutSection(group: verticalGroup)
       
         //リターン
       return UICollectionViewCompositionalLayout(section: section)
    }


    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath)
    }
}

