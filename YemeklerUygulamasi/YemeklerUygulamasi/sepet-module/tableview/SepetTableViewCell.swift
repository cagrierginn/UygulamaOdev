//
//  SepetTableViewCell.swift
//  YemeklerUygulamasi
//
//  Created by Çağrı Ergin on 28.02.2023.
//

import UIKit
import Alamofire

class SepetTableViewCell: UITableViewCell {

    @IBOutlet weak var sepetYemekAdiLabel: UILabel!
    @IBOutlet weak var sepetYemekFiyatLabel: UILabel!
    @IBOutlet weak var sepetYemekImage: UIImageView!
    @IBOutlet weak var sepetYemekAdetLabel: UILabel!
    
    


    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
