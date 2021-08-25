//
//  MainCell.swift
//  simpleAPI
//
//  Created by odikk on 25/08/21.
//

import UIKit

class MainCell: UITableViewCell {

    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
