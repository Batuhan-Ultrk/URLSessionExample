//
//  KisilerModel.swift
//  URLSessionExample
//
//  Created by Batuhan Ulutürk on 24.06.2024.
//

import Foundation

class KisilerModel : Codable {
   var kisi_id : String?
   var kisi_ad : String?
   var kisi_tel : String?
    
    init(kisi_id: String, kisi_ad: String, kisi_tel: String) {
        self.kisi_id = kisi_id
        self.kisi_ad = kisi_ad
        self.kisi_tel = kisi_tel
    }
    
}

class KisilerCevap : Codable{
    var kisiler : [KisilerModel]?
    var success : Int?
}
