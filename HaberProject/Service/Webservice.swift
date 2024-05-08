//
//  Webservice.swift
//  HaberProject
//
//  Created by Gülsüm Demirbaş on 7.05.2024.
//

import Foundation


class Webservice{
    
    
    func haberleriIndir( url: URL , completiton : @escaping ([News]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                completiton(nil)
            } else if let data = data {
                
                let haberDizisi = try? JSONDecoder().decode([News].self, from: data)
                
                if let haberDizisi = haberDizisi {
                    completiton(haberDizisi)
                }
                
            }
                 
            
        }.resume()
    }
    
}
