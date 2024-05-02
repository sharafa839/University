//
//  UniversityTableViewCell.swift
//  University
//
//  Created by Sharaf on 5/2/24.
//

import UIKit

class UniversityTableViewCell: UITableViewCell {

    @IBOutlet weak var universityNameLabel: UILabel!
    @IBOutlet weak var universityStateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func setupUI() {
        
    }

   
    func configure(_ university: University) {
        universityNameLabel.text = university.name
        universityStateLabel.text = university.state
    }
    
}
