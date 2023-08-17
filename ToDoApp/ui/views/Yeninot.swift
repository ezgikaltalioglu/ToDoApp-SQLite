//
//  Ikincisayfa.swift
//  ToDoApp
//
//  Created by Ezgi Kaltalıoğlu on 1.08.2023.
//

import UIKit

class Yeninot: UIViewController {
    
    
    @IBOutlet weak var tfNot: UITextField!
    
    var viewmodel = YeninotViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
    }
    

    @IBAction func butonKaydet(_ sender: Any) {
        if let nk = tfNot.text{
            viewmodel.kaydet(not_ad: nk)
        }
    }
    
  
    

}
