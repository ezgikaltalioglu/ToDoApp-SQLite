//
//  Not.swift
//  ToDoApp
//
//  Created by Ezgi Kaltalıoğlu on 1.08.2023.
//

import Foundation

class Not{
    
    var not_id:Int?
    var not_ad:String?
    
    
    init(){
        
    }
    
    init(not_id: Int, not_ad: String) {
        self.not_id = not_id
        self.not_ad = not_ad
    }
}
