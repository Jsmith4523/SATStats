//
//  SchoolTableViewCell.swift
//  SATStats
//
//  Created by Jaylen Smith on 10/27/23.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {
    
    ///Table View identifier
    static let identifier = "School"
    
    //MARK: Labels
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dbnLabel: UILabel!
    
    var school: School! {
        didSet {
            nameLabel.text = school.name
            dbnLabel.text = school.dbn
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
