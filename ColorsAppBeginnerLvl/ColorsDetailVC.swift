//
//  ColorsDetailVC.swift
//  ColorsAppBeginnerLvl
//
//  Created by Consultant on 12/19/22.
//

import UIKit

class ColorsDetailVC: UIViewController {

    // PAssing Colors from one VC to another this variable is waiting to receive what color it is going to show -- so from the selection picked on screen 1 = ColorsVS, this color is now passed to the next VC we have -- ColorsDetailVC
    var color: UIColor? 
    override func viewDidLoad() {
        super.viewDidLoad()

        //nil coalescing to unwrap here --- this is saying that this accepts the color of what was selected, if not, use default color of blue
        view.backgroundColor = color ?? .blue
        
        
        // Do any additional setup after loading the view.
    }
    



}
