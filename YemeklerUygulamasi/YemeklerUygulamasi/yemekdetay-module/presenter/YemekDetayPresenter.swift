//
//  YemekDetayPresenter.swift
//  YemeklerUygulamasi
//
//  Created by Çağrı Ergin on 28.02.2023.
//

import Foundation

class YemekDetayPresenter : ViewToPresenterYemekDetayProtocol, InteractorToPresenterYemekDetayProtocol {
    
    var yemekDetayView: PresenterToViewYemekDetayProtocol?
    
    var yemekDetayInteractor: PresenterToInteractorYemekDetayProtocol?
    
    func goster() {
        
    }
    
    func ekle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: String, kullanici_adi: String) {
        
        yemekDetayInteractor?.sepeteYemekEkle(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)
    }
    
    func sepetiGetir() {
        yemekDetayInteractor?.getir()
    }
    
    func sepettenYemekSil(sepet_yemek_id: String) {
        yemekDetayInteractor?.yemekSil(sepet_yemek_id: sepet_yemek_id)
    }
    
    
    func presenteraSepetiGonder(sepetListesi: Array<SepetYemekler>) {
        yemekDetayView?.vieweSepetiGonder(sepetListesi: sepetListesi)
    }
    
}
