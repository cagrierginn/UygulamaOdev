//
//  SepetProtocols.swift
//  YemeklerUygulamasi
//
//  Created by Çağrı Ergin on 28.02.2023.
//

import Foundation
import Alamofire
import UIKit

protocol ViewToPresenterSepetProtocol{
    var sepetView : PresenterToViewSepetProtocol? {get set}
    var sepetInteractor : PresenterToInteractorSepetProtocol? {get set}
    
    func sepetiListele()
    func sepettenYemekSil(sepet_yemek_id:String)
}

protocol PresenterToInteractorSepetProtocol {
    var sepetPresenter : InteractorToPresenterSepetProtocol? {get set}
    
    func listele()
    func yemekSil(sepet_yemek_id:String)
}

protocol InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(sepetYemekListesi:Array<SepetYemekler>)
}

protocol PresenterToViewSepetProtocol {
    func vieweVeriGonder(sepetYemekListesi:Array<SepetYemekler>)
}

protocol PresenterToRouterSepetProtocol {
    static func createModule(ref:SepetVC)
}

