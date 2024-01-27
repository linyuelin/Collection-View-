//
//  ImageCollectionViewCell.swift
//  Waterfall
//
//  Created by dreaMTank on 2024/01/27.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    static let identifier = "ImageCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        contentView.addSubview(imageView)
        contentView.clipsToBounds = true
    }
    
    private var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    func configure(image: UIImage?){
        imageView.image = image
    }
    
}
