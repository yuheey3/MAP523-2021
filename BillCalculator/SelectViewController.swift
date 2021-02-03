//
//  SelectViewController.swift
//  Assignment1
//  Date: Feb.3 2021
//  Student ID : 141082180
//  Created by Yuki Waka on 2021-02-01.
//

import UIKit

class SelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //button action
    @IBAction func calculator(){
        self.goToCalculator()
    }
    
    //go to calculator view
    func goToCalculator()
    {
        //identify the storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        //create instant of the destination ViewController
        let calVC = storyboard.instantiateViewController(identifier: "CalVC")
        
        //add the new screen/VC on the Navigation Stack
        self.navigationController?.pushViewController(calVC, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

