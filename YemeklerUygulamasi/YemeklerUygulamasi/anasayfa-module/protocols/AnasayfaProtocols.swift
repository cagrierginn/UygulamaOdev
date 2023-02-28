//
//  AnasayfaProtocols.swift
//  YemeklerUygulamasi
//
//  Created by Çağrı Ergin on 28.02.2023.
//


import Foundation

protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaView : PresenterToViewAnasayfaProtocol? {get set}
    var anasayfaInteractor : PresenterToInteractorAnasayfaProtocol? {get set}
    
    func yemekleriListele()
    func yemekAra(aramaKelimesi:String)
    func sepeteYemekEkle(yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:String, yemek_siparis_adet:String,kullanici_adi:String)
    
    func sepetiGetir()
    func sepettenYemekSil(sepet_yemek_id:String)
    
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter : InteractorToPresenterAnasayfaProtocol? {get set}
    
    func listele()
    func ara(aramaKelimesi:String)
    func ekle(yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:String, yemek_siparis_adet:String,kullanici_adi:String)
    
    func getir()
    func yemekSil(sepet_yemek_id:String)
    
    
}

protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yemeklerListesi:Array<Yemekler>)
    
    func presenteraSepetListesiGonder(sepetListesi:Array<SepetYemekler>)
   
}

protocol PresenterToViewAnasayfaProtocol {
    
    func vieweVeriGondor(yemeklerListesi:Array<Yemekler>)
    
    func vieweSepetListesiGonder(sepetListesi:Array<SepetYemekler>)
}

protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref:AnasayfaVC)
}



protocol YemeklerCollectionViewCellToAnasayfaVCProtocol {
    func butonaTiklandi(indexPath:IndexPath)
}
