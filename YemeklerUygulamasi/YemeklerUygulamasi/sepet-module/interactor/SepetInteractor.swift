//
//  SepetInteractor.swift
//  YemeklerUygulamasi
//
//  Created by Çağrı Ergin on 28.02.2023.
//


import Foundation
import Alamofire

class SepetInteractor : PresenterToInteractorSepetProtocol {
    
    var sepetPresenter: InteractorToPresenterSepetProtocol?
    
    
    func listele() {
        let kullanici_adi="cagri_ergin"
        let params:Parameters = ["kullanici_adi":kullanici_adi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters: params).response{ response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(SepetYemeklerCevap.self,from: data)
                    var sepetList = [SepetYemekler]()
                    if let gelenListe = cevap.sepet_yemekler {
                        sepetList = gelenListe
                    }
                    self.sepetPresenter?.presenteraVeriGonder(sepetYemekListesi: sepetList)
                }catch{
                    self.sepetPresenter?.presenteraVeriGonder(sepetYemekListesi: [])
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func yemekSil(sepet_yemek_id: String) {
        let kullanici_adi="cagri_ergin"
        let params:Parameters = ["sepet_yemek_id":sepet_yemek_id,"kullanici_adi":kullanici_adi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post,parameters: params).response{ response in
            if let data = response.data {
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print(json)
                        
                        self.listele()
                    }
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
