//
//  AnasayfaViewModel.swift
//  ToDoApp
//
//  Created by Ezgi Kaltalıoğlu on 14.08.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel{
    
    var nrepo = TodoDaoRepository()
    var notlarListesi = BehaviorSubject<[Not]>(value: [Not]())
    
    init() {
        veritabaniKopyala()
        notlarListesi = nrepo.notlarListesi
        
    }
    
    
    func sil(not_id:Int){
        nrepo.sil(not_id: not_id)
        notlariYukle()
    }
    
    func arama(aramaKelimesi:String){
        nrepo.arama(aramaKelimesi: aramaKelimesi)
    }
    
    func notlariYukle(){
        
        nrepo.notlariYukle()
    }
    
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "toDos", ofType: ".sqlite")
        
        let dosyaYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: dosyaYolu).appendingPathComponent("toDos.sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: veritabaniURL.path){
            print("Veritabanı zaten var")
        }else{
            
            do{
                
                try fm.copyItem(atPath: bundleYolu!, toPath: veritabaniURL.path)
                
            }catch{
                print(error.localizedDescription)
            }
            
        }
    }
}
