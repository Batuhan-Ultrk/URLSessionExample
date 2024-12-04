//
//  KisilerDao.swift
//  URLSessionExample
//
//  Created by Batuhan Ulutürk on 24.06.2024.
//

import Foundation

class KisilerDao {
    
    func kisileriYukle(){
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php")!
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            do{
                let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data!)
                
                print("Başarı : \(cevap.success!)")
                
                if let liste = cevap.kisiler {
                    for i in liste {
                        print("-----------------------------------")
                        print("Kisi Id : \(i.kisi_id!)")
                        print("Kisi Ad : \(i.kisi_ad!)")
                        print("Kisi Tel : \(i.kisi_tel!)")
                    }
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func kisiEkle(kisiAd: String , kisiTel : String) {
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php")!
        
        var istek = URLRequest(url: url)
        istek.httpMethod = "POST"
        let postString = "kisi_ad=\(kisiAd)&kisi_tel=\(kisiTel)"
        istek.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: istek){ data, response, error in
            do{
                let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data!)
                print("----------Kaydet-------------")
                print("Başarı : \(cevap.success!)")
                print("Mesaj : \(cevap.message!)")
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func kisiGuncelle(kisiId : Int , kisiAd : String , kisiTel : String){
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/update_kisiler.php")!
        
        var istek = URLRequest(url: url)
        istek.httpMethod = "POST"
        let postString = "kisi_id=\(kisiId)&kisi_ad=\(kisiAd)&kisi_tel=\(kisiTel)"
        istek.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: istek){ data, response, error in
            do{
                let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data!)
                print("----------Güncelle-------------")
                print("Başarı : \(cevap.success!)")
                print("Mesaj : \(cevap.message!)")
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}
