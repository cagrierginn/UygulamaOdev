//
//  AnasayfaPresenter.swift
//  YemeklerUygulamasi
//
//  Created by Çağrı Ergin on 28.02.2023.
//

import Foundation

class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol, InteractorToPresenterAnasayfaProtocol {
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    
    func yemekleriListele() {
        anasayfaInteractor?.listele()
    }
    func yemekAra(aramaKelimesi: String) {
        anasayfaInteractor?.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func sepeteYemekEkle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: String, kullanici_adi: String) {
        anasayfaInteractor?.ekle(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat,yemek_siparis_adet:yemek_siparis_adet,kullanici_adi:kullanici_adi)
    }
    
    func sepetiGetir() {
        anasayfaInteractor?.getir()
    }
    
    func sepettenYemekSil(sepet_yemek_id: String) {
        anasayfaInteractor?.yemekSil(sepet_yemek_id: sepet_yemek_id)
    }
    
    func presenteraSepetListesiGonder(sepetListesi: Array<SepetYemekler>) {
        anasayfaView?.vieweSepetListesiGonder(sepetListesi: sepetListesi)
    }
    
    func presenteraVeriGonder(yemeklerListesi: Array<Yemekler>) {
        anasayfaView?.vieweVeriGondor(yemeklerListesi: yemeklerListesi)
    }
    
}
