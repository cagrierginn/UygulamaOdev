//
//  SepetVC.swift
//  YemeklerUygulamasi
//
//  Created by Çağrı Ergin on 28.02.2023.
//

import UIKit
import Alamofire
import Lottie


class SepetVC: UIViewController {
    
    @IBOutlet weak var sepetTableView: UITableView!
    @IBOutlet weak var odenecekTutarLabel: UILabel!
    @IBOutlet weak var odenecekView: UIView!
    
    var sepetYemekSayisi = 0 // sepetteki yemek sayisini badge'e aktarabilmek için oluşturuldu.
    var hucredekiSepetAdeti = 0
    
    var sepetYemekListesi = [SepetYemekler]()
    
    var animationView : LottieAnimationView?
    
    var sepetPresenterNesnesi : ViewToPresenterSepetProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sepetTableView.delegate = self
        sepetTableView.dataSource = self
        
        
        SepetRouter.createModule(ref: self)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        sepetPresenterNesnesi?.sepetiListele()
        DispatchQueue.main.async {
            let gelenSepetListesi = self.sepetYemekListesi
            var tutar = 0
          
            for indx in stride(from: 0, to:gelenSepetListesi.count , by: 1){
                tutar = tutar + ( Int(gelenSepetListesi[indx].yemek_fiyat!)! * Int(gelenSepetListesi[indx].yemek_siparis_adet!)! )
            }
            if tutar == 0 {
                self.odenecekTutarLabel.text = " "
            }else{
                self.odenecekTutarLabel.text = "\(String(tutar)) ₺"
            }
        }
    }
    
    @IBAction func devamButton(_ sender: Any) {
        print("devam tiklandi")
        
        sepetTableView.isHidden = true
        odenecekView.isHidden = true
        animationView = .init(name: "58362-man-delivery")
        animationView?.frame = view.bounds
        animationView?.loopMode = .playOnce
        animationView?.animationSpeed = 0.8
        animationView?.play(fromProgress: 0, toProgress: 1, loopMode: .autoReverse){ (finished) in
            self.sepetTableView.isHidden = true
        }
        view.addSubview(animationView!)
        
    }
}

extension SepetVC : PresenterToViewSepetProtocol {
    func vieweVeriGonder(sepetYemekListesi: Array<SepetYemekler>) {
        self.sepetYemekListesi = sepetYemekListesi
        self.sepetYemekSayisi = self.sepetYemekListesi.count
        DispatchQueue.main.async {
            self.sepetTableView.reloadData()
        }
    }
}

extension SepetVC : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sepetYemekListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sepetTableView.dequeueReusableCell(withIdentifier: "sepetHucre", for: indexPath) as! SepetTableViewCell
        cell.sepetYemekAdiLabel.text = sepetYemekListesi[indexPath.row].yemek_adi
        cell.sepetYemekFiyatLabel.text = "\(sepetYemekListesi[indexPath.row].yemek_fiyat!) ₺"

        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(sepetYemekListesi[indexPath.row].yemek_resim_adi!)"){
            DispatchQueue.main.async {
                cell.sepetYemekImage.kf.setImage(with:url)
            }
        }
        
        cell.sepetYemekAdetLabel.text = "\(sepetYemekListesi[indexPath.row].yemek_siparis_adet!) adet"
        
        cell.layer.cornerRadius = 20
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let sepettekiYemek = sepetYemekListesi[indexPath.row]
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { (ca, v, b) in
            print("\(sepettekiYemek.yemek_adi!) silindi.")
         
            self.sepetPresenterNesnesi?.sepettenYemekSil(sepet_yemek_id: sepettekiYemek.sepet_yemek_id!)
            
            //badge
            if let tabBarItems = self.tabBarController?.tabBar.items {
                let tabItem = tabBarItems[1]
                    tabItem.badgeValue = String(self.sepetYemekSayisi - 1)
                self.sepetYemekSayisi = self.sepetYemekSayisi - 1
                if tabItem.badgeValue == "0" {
                    tabItem.badgeValue = nil
                }
            }
            
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
