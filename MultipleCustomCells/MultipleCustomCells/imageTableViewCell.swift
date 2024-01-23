//
//  imageTableViewCell.swift
//  MultipleCustomCells
//
//  Created by dreaMTank on 2024/01/23.
//

import UIKit

class imageTableViewCell: UITableViewCell {

    static let identifier = "imageTableViewCell"
    
    @IBOutlet  var myImageView: UIImageView!
    
    static func nib() -> UINib {
        return UINib(nibName: "imageTableViewCell", bundle: nil)
    }
    
    public func configure(with imageName: String){
        myImageView.image = UIImage(named: imageName)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
