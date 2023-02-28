//
//  YemekDetayRouter.swift
//  YemeklerUygulamasi
//
//  Created by Çağrı Ergin on 28.02.2023.
//

import Foundation

class YemekDetayRouter : presenterToRouterYemekDetay {
    
    static func creatModule(ref: YemekDetayVC) {
        
        let presenter = YemekDetayPresenter()
        
        ref.yemekDetayPresenterNesnesi = presenter
        ref.yemekDetayPresenterNesnesi?.yemekDetayInteractor = YemekDetayInteractor()
        ref.yemekDetayPresenterNesnesi?.yemekDetayView = ref
        ref.yemekDetayPresenterNesnesi?.yemekDetayInteractor?.yemekDetayPresenter = presenter
        
    }
}

