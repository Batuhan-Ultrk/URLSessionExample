//
//  ContentView.swift
//  URLSessionExample
//
//  Created by Batuhan Ulutürk on 24.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onAppear{
            let kisilerDao = KisilerDao()
          
            //kisilerDao.kisiEkle(kisiAd: "Selin", kisiTel: "12312312")
            //kisilerDao.kisiGuncelle(kisiId: 17447, kisiAd: "Selim", kisiTel: "9090909090")
            
            
            kisilerDao.kisileriYukle()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

