//
//  MenuViewController.swift
//  PirateHandBook
//
//  Created by Myo Set Paing on 6/7/19.
//  Copyright © 2019 Myo Set Paing. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
