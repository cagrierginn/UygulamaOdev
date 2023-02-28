//
//  SepetRouter.swift
//  YemeklerUygulamasi
//
//  Created by Çağrı Ergin on 28.02.2023.
//

import Foundation
import Alamofire

class SepetRouter : PresenterToRouterSepetProtocol {
    
    static func createModule(ref: SepetVC) {
        
        let presenter = SepetPresenter()
        
        ref.sepetPresenterNesnesi = presenter
        ref.sepetPresenterNesnesi?.sepetView = ref
        ref.sepetPresenterNesnesi?.sepetInteractor = SepetInteractor()
        ref.sepetPresenterNesnesi?.sepetInteractor?.sepetPresenter = presenter
    
    }
}

