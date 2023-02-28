//
//  AnasayfaInteractor.swift
//  YemeklerUygulamasi
//
//  Created by Çağrı Ergin on 28.02.2023.
//

import Foundation
import Alamofire

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter : InteractorToPresenterAnasayfaProtocol?
   
    
    
    func listele() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).response{ response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data)
                    if let gelenListe = cevap.yemekler {
                        self.anasayfaPresenter?.presenteraVeriGonder(yemeklerListesi: gelenListe)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func ara(aramaKelimesi: String) {
        let params:Parameters = ["yemek_adi":aramaKelimesi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .post,parameters: params).response{ response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(YemeklerCevap.self,from: data)
                    if let gelenListe = cevap.yemekler {
                        self.anasayfaPresenter?.presenteraVeriGonder(yemeklerListesi: gelenListe)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    func ekle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: String, kullanici_adi: String) {
        let params:Parameters = ["yemek_adi":yemek_adi,"yemek_resim_adi":yemek_resim_adi,"yemek_fiyat":yemek_fiyat,"yemek_siparis_adet":yemek_siparis_adet,"kullanici_adi":kullanici_adi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post,parameters: params).response{ response in
            if let data = response.data {
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print(json)
                        
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }

    
    func getir() {
        let kullanici_adi="cagri_ergin"
        let params:Parameters = ["kullanici_adi":kullanici_adi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters: params).response{ response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(SepetYemeklerCevap.self,from: data)
                    var sepetListe:[SepetYemekler] = []
                    if let gelenListe = cevap.sepet_yemekler {
                        sepetListe = gelenListe
                     
                        self.anasayfaPresenter?.presenteraSepetListesiGonder(sepetListesi: sepetListe)
                    }

                }catch{
                    
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
                        
                        self.getir()
                    }
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}

