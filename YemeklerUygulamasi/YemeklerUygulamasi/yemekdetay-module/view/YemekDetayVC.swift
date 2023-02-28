//
//  YemekDetayVC.swift
//  YemeklerUygulamasi
//
//  Created by Çağrı Ergin on 28.02.2023.
//

import UIKit
import Alamofire
import Kingfisher

class YemekDetayVC: UIViewController {
    
    @IBOutlet weak var yemekDetayImage: UIImageView!
    @IBOutlet weak var yemekDetayLabel: UILabel!
    @IBOutlet weak var yemekFiyat: UILabel!
    @IBOutlet weak var yemekAdetLabel: UILabel!
    
    
    var yemek:Yemekler?
    var yemekDetayPresenterNesnesi:ViewToPresenterYemekDetayProtocol?
    
    var gelenSepetListesi : [SepetYemekler] = []
    var gelenSepetSayisi = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yemekAdetLabel.text = "1"
    
        YemekDetayRouter.creatModule(ref: self)
        if let y = yemek {
            
            
            if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(y.yemek_resim_adi!)"){
                DispatchQueue.main.async {
                    self.yemekDetayImage.kf.setImage(with:url)
                }
            }
            yemekDetayLabel.text = y.yemek_adi!
            yemekFiyat.text = "\(y.yemek_fiyat!) ₺"
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        yemekDetayPresenterNesnesi?.sepetiGetir()
    }
    
    @IBAction func buttonAdetEksilt(_ sender: Any) {
        print("\(yemekDetayLabel.text!) eksilt tiklandi")
        var adet = Int(yemekAdetLabel.text!)
        if adet! > 1 {
            adet = adet! - 1
            yemekAdetLabel.text = String(adet!)
        }
        
    }
    
    
    @IBAction func buttonAdetArttir(_ sender: Any) {
        print("\(yemekDetayLabel.text!) arttir tiklandi.")
        var adet = Int(yemekAdetLabel.text!)
        adet = adet! + 1
        yemekAdetLabel.text = String(adet!)
        
    }
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        //print("sepete ekle tiklandi.\(yemekAdetLabel.text!)")
        let yemek_adi = yemekDetayLabel.text!
        var yemek_resim_adi = yemekDetayLabel.text!.removeWhiteSpace().lowercased()+".png"
        if yemek_resim_adi.contains("ı"){
            yemek_resim_adi = yemek_resim_adi.replacingOccurrences(of: "ı", with: "i", options: .literal, range: nil)
        }
        let yemek_fiyat1 = yemekFiyat.text!.split(separator: " ").first!
        let yemek_fiyat = String(yemek_fiyat1)
        let yemek_siparis_adet = yemekAdetLabel.text!
        let kullanici_adi = "cagri_ergin"
        
        let liste = self.gelenSepetListesi
        var tempList = [String]()
        for indx in stride(from: 0, to: liste.count, by: 1){
            tempList.append(liste[indx].yemek_adi!)
        }
        print("\(tempList)")
        var indis = 0 // listede hal,hazırda bulunan yemeğin indisini öğrenmek için
        if tempList.contains(yemek_adi){
            print("içeriyor")
            for ind in stride(from: 0, to: tempList.count, by: 1) {
                if yemek_adi == tempList[ind]{
                    indis = ind
                }
            }
            
            let sepettekiYemek = self.gelenSepetListesi[indis]
            self.yemekDetayPresenterNesnesi?.sepettenYemekSil(sepet_yemek_id: sepettekiYemek.sepet_yemek_id!)
            
            self.yemekDetayPresenterNesnesi?.ekle(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: String(Int(sepettekiYemek.yemek_siparis_adet!)! + Int(yemek_siparis_adet)!), kullanici_adi: kullanici_adi)
            
        }else{
            print("içermiyor")
            yemekDetayPresenterNesnesi?.ekle(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)
        }
    }
}

extension YemekDetayVC : PresenterToViewYemekDetayProtocol {
    func vieweSepetiGonder(sepetListesi: Array<SepetYemekler>) {
        self.gelenSepetListesi = sepetListesi
        DispatchQueue.main.async {
            self.gelenSepetSayisi = sepetListesi.count
            if let tabBarItems = self.tabBarController?.tabBar.items {
                let tabItem = tabBarItems[1]
                tabItem.badgeValue = String(self.gelenSepetSayisi)
            }
        }
    }
}

extension String {
    func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }
    func removeWhiteSpace() -> String {
        return self.replace(string: " ", replacement: "")
    }
}

