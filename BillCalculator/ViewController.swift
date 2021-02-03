//
//  ViewController.swift
//  Assignment1
//  Date: Feb.3 2021
//  Student ID : 141082180
//  Created by Yuki Waka on 2021-01-27.
//

import UIKit

class ViewController: UIViewController {
    //declare textfield and label
    @IBOutlet var onPeaktf : UITextField!
    @IBOutlet var offPeaktf : UITextField!
    @IBOutlet var midPeaktf : UITextField!
    @IBOutlet var totalChargetf : UILabel!
    @IBOutlet var netBillAmounttf : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set navigation title
        self.navigationItem.title = "Bill Calculator"
        //hidden for two label
        totalChargetf.isHidden = true
        netBillAmounttf.isHidden = true
        
    }
    //when touch screen, hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //button action
    @IBAction func btnCalculateCharge(){
        print(#function, "Button Clicked")
        var onPeak = 0.0
        var offPeak = 0.0
        var midPeak = 0.0
        var totalCharge = 0.0
        var netBillAmount = 0.0
        var chargeOnPeak = 0.0
        var chargeOffPeak = 0.0
        var chargemidPeak = 0.0
        //rebate and hst
        let rebate = 0.92
        let hst = 1.13
        //alert
        var alertMessage : String
        
        //validation
        //when all the textfield are filled
        if((onPeaktf.text?.isEmpty) != true && (offPeaktf.text?.isEmpty) != true && (midPeaktf.text?.isEmpty) != true){
            onPeak = Double(onPeaktf.text!) ?? 0
            offPeak = Double(offPeaktf.text!) ?? 0
            midPeak = Double(midPeaktf.text!) ?? 0
            
            //format for decimal
            let numberFormatter = NumberFormatter()
            numberFormatter.roundingMode = .floor
            numberFormatter.minimumSignificantDigits = 2
            numberFormatter.maximumSignificantDigits = 4

            //calculate
            chargeOnPeak = onPeak * 0.132
            chargeOffPeak = offPeak * 0.065
            chargemidPeak = midPeak * 0.094
            
            //total charge
            totalCharge = chargeOnPeak + chargeOffPeak + chargemidPeak
            
            let tCharge = numberFormatter.string(from: NSNumber(value: totalCharge))
            totalChargetf.text = "Total consumption charge: $" + String(tCharge!)
            
            //net bill amount
            netBillAmount = totalCharge * hst * rebate
            
            let nAmount = numberFormatter.string(from: NSNumber(value: netBillAmount))
            
            netBillAmounttf.text = "The net bill amount: $" + String(nAmount!)
            
            //display two label
            totalChargetf.isHidden = false
            netBillAmounttf.isHidden = false
        
            //when one of the textfield is empty
            }else{
                //alert
                alertMessage = "Please enter the all usages."
                let alert = UIAlertController(title: "Result", message: alertMessage, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
                self.present(alert, animated: true)
            
                    
        
    }
}
}


