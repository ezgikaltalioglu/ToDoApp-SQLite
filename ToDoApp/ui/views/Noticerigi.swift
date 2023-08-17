//
//  Ucuncusayfa.swift
//  ToDoApp
//
//  Created by Ezgi Kaltalıoğlu on 1.08.2023.
//

import UIKit

class Noticerigi: UIViewController {
    
    @IBOutlet weak var tfNot: UITextField!
    
    var viewmodel = NoticerigiViewModel()
    
    var not:Not?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let n = not{
            tfNot.text = n.not_ad
        }
    }
    
    @IBAction func butonGuncelle(_ sender: Any) {
        
        if let nk = tfNot.text, let n = not{
         
            viewmodel.guncelle(not_id: n.not_id!, not_ad: nk)
        }
    }
    
    
}
