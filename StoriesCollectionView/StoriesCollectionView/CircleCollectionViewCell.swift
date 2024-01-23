//
//  CircleCollectionViewCell.swift
//  StoriesCollectionView
//
//  Created by dreaMTank on 2024/01/23.
//

import UIKit

class CircleCollectionViewCell: UICollectionViewCell {
    
     static let identifier = "CircleCollectionViewCell"
    
    private let myImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.clipsToBounds = true
        myImageView.contentMode = .scaleAspectFill
        myImageView.layer.masksToBounds = true
        myImageView.layer.cornerRadius = 150.0/2.0   //半径
        myImageView.backgroundColor = .blue
        myImageView.layer.borderWidth = 2
        myImageView.layer.borderColor = UIColor.link.cgColor  //枠の色
        return myImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myImageView.frame = contentView.bounds
        
    }
    public func configure(with name: String) {
        myImageView.image = UIImage(named: name)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView .image = nil 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
