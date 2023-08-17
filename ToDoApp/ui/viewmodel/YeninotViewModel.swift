//
//  YeninotViewModel.swift
//  ToDoApp
//
//  Created by Ezgi Kaltalıoğlu on 14.08.2023.
//

import Foundation

class YeninotViewModel{
    
    var nrepo = TodoDaoRepository()
    
    func kaydet(not_ad:String){
        nrepo.kaydet(not_ad: not_ad)
    }
    
}
