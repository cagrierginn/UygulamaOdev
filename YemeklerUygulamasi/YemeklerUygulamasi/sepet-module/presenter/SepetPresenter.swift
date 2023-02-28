//
//  SepetPresenter.swift
//  YemeklerUygulamasi
//
//  Created by Çağrı Ergin on 28.02.2023.
//

import Foundation
import Alamofire

class SepetPresenter : ViewToPresenterSepetProtocol, InteractorToPresenterSepetProtocol {
  
    var sepetView: PresenterToViewSepetProtocol?
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    
    func sepetiListele() {
        sepetInteractor?.listele()
    }
    
    func sepettenYemekSil(sepet_yemek_id: String) {
        sepetInteractor?.yemekSil(sepet_yemek_id: sepet_yemek_id)
    }
    
    func presenteraVeriGonder(sepetYemekListesi: Array<SepetYemekler>) {
        sepetView?.vieweVeriGonder(sepetYemekListesi: sepetYemekListesi)
    }
    

}
