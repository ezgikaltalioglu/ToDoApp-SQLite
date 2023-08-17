//
//  TodoDaoRepository.swift
//  ToDoApp
//
//  Created by Ezgi Kaltalıoğlu on 14.08.2023.
//

import Foundation
import RxSwift

class TodoDaoRepository{
    
    var notlarListesi = BehaviorSubject<[Not]>(value: [Not]())
    
    let db:FMDatabase?
    
    init() {
        let dosyaYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: dosyaYolu).appendingPathComponent("toDos.sqlite")
        
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func kaydet(not_ad:String){
        
        db?.open()
        
        do{
            
            try db!.executeUpdate("INSERT INTO toDos (not_ad) VALUES (?)", values: [not_ad])
            
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    
    func guncelle(not_id: Int, not_ad: String){
        db?.open()
        
        do{
            
            try db!.executeUpdate("UPDATE toDos SET not_ad = ? WHERE not_id = ? ", values: [not_ad,not_id])
            
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func sil(not_id:Int){
        db?.open()
        
        do{
            
            try db!.executeUpdate("DELETE FROM toDos WHERE not_id = ?", values: [not_id])
            
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func arama(aramaKelimesi:String){
        
        db?.open()
        
        var liste = [Not]()
        
        do{
            
            let result = try db!.executeQuery("SELECT * From toDos WHERE not_ad like '%\(aramaKelimesi)%'", values: nil)
            
            while result.next() {
                
                let not_id = Int(result.string(forColumn: "not_id"))!
                let not_ad = result.string(forColumn: "not_ad")!
                
                let not = Not(not_id: not_id, not_ad: not_ad)
                liste.append(not)
            }
            
            notlarListesi.onNext(liste)
            
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
        
    }
    
    func notlariYukle(){
    
        
        db?.open()
        
        var liste = [Not]()
        
        do{
            
            let result = try db!.executeQuery("SELECT * From toDos", values: nil)
            
            while result.next() {
                
                let not_id = Int(result.string(forColumn: "not_id"))!
                let not_ad = result.string(forColumn: "not_ad")!
                
                let not = Not(not_id: not_id, not_ad: not_ad)
                liste.append(not)
            }
            
            notlarListesi.onNext(liste)
            
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
        
    }
    
}
