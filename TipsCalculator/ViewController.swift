//
//  ViewController.swift
//  TipsCalculator
//
//  Created by Carlos Camacho on 2020-05-08.
//  Copyright © 2020 Carlos Camacho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //Declarations View
    
    @IBOutlet weak var TotalTipsLabel: UILabel!
    
    @IBOutlet weak var BillAmount: UITextField!
    
    @IBOutlet weak var PercentageTip: UILabel!
    
    
    @IBOutlet weak var slideTip: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let Tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self , action: #selector(DissmissKeyboard))
        
        view.addGestureRecognizer(Tap)
    }

    @objc func DissmissKeyboard(){
        view.endEditing(true)
    }
    
    
    @IBAction func SliderTipsChanged(_ sender: Any) {
        calculatedTips()
    }
    
    @IBAction func changeAmountBill(_ sender: Any) {
        calculatedTips()
    }
    
    func calculatedTips(){
        if (BillAmount.text) != nil && (BillAmount.text) != "" {
            let valueTip = Int((BillAmount.text! as NSString).floatValue * slideTip.value)
            PercentageTip.text = "\(Int(slideTip.value * 100))%"
            TotalTipsLabel.text = "\(valueTip) !!"
        }else{
            TotalTipsLabel.text = "Please set amount bill"
        }
    }

}

