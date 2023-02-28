//
//  AnasayfaRouter.swift
//  YemeklerUygulamasi
//
//  Created by Çağrı Ergin on 28.02.2023.
//

import Foundation

class AnasayfaRouter : PresenterToRouterAnasayfaProtocol{
    static func createModule(ref: AnasayfaVC) {
        
        let presenter = AnasayfaPresenter()
        
        
        ref.anasayfaPresenterNesnesi = presenter
        
        ref.anasayfaPresenterNesnesi?.anasayfaView = ref
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor = AnasayfaInteractor()
        
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor?.anasayfaPresenter = presenter
        
        
        
    }
}
