//
//  YemekDetayProtocols.swift
//  YemeklerUygulamasi
//
//  Created by Çağrı Ergin on 28.02.2023.
//

import Foundation

protocol ViewToPresenterYemekDetayProtocol {
    var yemekDetayView : PresenterToViewYemekDetayProtocol? {get set}
    var yemekDetayInteractor : PresenterToInteractorYemekDetayProtocol? {get set}
    
    func goster()
    func ekle(yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:String, yemek_siparis_adet:String,kullanici_adi:String)
    
    
    func sepetiGetir()
    func sepettenYemekSil(sepet_yemek_id:String)
}

protocol PresenterToInteractorYemekDetayProtocol {
    var yemekDetayPresenter : InteractorToPresenterYemekDetayProtocol? {get set}
    
    func detayGoster()
    func sepeteYemekEkle(yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:String, yemek_siparis_adet:String,kullanici_adi:String)
    
    func getir()
    func yemekSil(sepet_yemek_id:String)
}

protocol InteractorToPresenterYemekDetayProtocol {
    func presenteraSepetiGonder(sepetListesi:Array<SepetYemekler>)
}

protocol PresenterToViewYemekDetayProtocol {
    func vieweSepetiGonder(sepetListesi:Array<SepetYemekler>)
}

protocol presenterToRouterYemekDetay {
    static func creatModule(ref:YemekDetayVC)
}

