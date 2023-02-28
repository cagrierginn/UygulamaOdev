//
//  YemeklerCollectionViewCell.swift
//  YemeklerUygulamasi
//
//  Created by Çağrı Ergin on 28.02.2023.
//

import UIKit

class YemeklerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var yemekImage: UIImageView!
    @IBOutlet weak var yemekAdLabel: UILabel!
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    
    var cellToAnasayfaVC : YemeklerCollectionViewCellToAnasayfaVCProtocol?
    var indexPath : IndexPath?
    
    @IBAction func sepeteEkleButton(_ sender: Any) {
        cellToAnasayfaVC?.butonaTiklandi(indexPath: indexPath!)
    }
}
