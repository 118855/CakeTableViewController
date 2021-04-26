//
//  CakeTableViewCell.swift
//  CakeTableViewController
//
//  Created by admin on 26.04.2021.
//

import UIKit

class CakeTableViewCell: UITableViewCell {
    
    @IBOutlet var cakeNameLabel: UILabel!
    @IBOutlet var componentLabel: UILabel!
    @IBOutlet var imageOfCake: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateCell(with cake: Cake) {
        cakeNameLabel?.text = cake.name
        componentLabel?.text = cake.components
        imageOfCake?.image = UIImage(named: cake.name)
    }

}
