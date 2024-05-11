//
//  HomeTableCell.swift
//  LndryApp
//
//  Created by Muaaz Ahmed on 11/05/2024.
//

import UIKit

class HomeTableCell: UITableViewCell {

    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var mainImg: UIImageView!
    
    @IBOutlet weak var titkeLbl: UILabel!
    
    @IBOutlet weak var nextImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(info: [String: Any], color : UIColor) {
        if let image = info["image"] as? UIImage {
            mainImg.image = image
        }
        
        if let title = info["title"] as? String {
            titkeLbl.text = title
        }
        
        containerView.backgroundColor = color
        containerView.roundAllCorners(radius: 15)

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
