//
//  ExerciseCellTableViewCell.swift
//  StartSchool
//
//  Created by Mateusz Uszyński on 08/12/2020.
//

import UIKit

class ExerciseCellTableViewCell: UITableViewCell {
    @IBOutlet weak var exerciseBuble: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var leftImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        exerciseBuble.layer.cornerRadius = exerciseBuble.frame.size.height/3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
