//
//  FlashcardCell.swift
//  StartSchool
//
//  Created by Mateusz Uszyński on 08/12/2020.
//

import UIKit

class FlashcardCell: UITableViewCell {

    @IBOutlet weak var flashcardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var bottomImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        flashcardView.layer.cornerRadius = flashcardView.frame.size.height/5
    }
    
}
