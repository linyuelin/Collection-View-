//
//  MyCollectionViewCell.swift
//  HeaderFooter
//
//  Created by dreaMTank on 2024/01/23.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    
    static let identifier = "MyCollectionViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .link
    }

}
