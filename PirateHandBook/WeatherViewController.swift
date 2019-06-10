//
//  WeatherViewController.swift
//  PirateHandBook
//
//  Created by Myo Set Paing on 6/7/19.
//  Copyright © 2019 Myo Set Paing. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet private(set) var backgroundImageView: UIImageView!
    @IBOutlet private var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpImages(traitCollection: traitCollection)
    }
    
    override func willTransition(
        to newCollection: UITraitCollection,
        with coordinator: UIViewControllerTransitionCoordinator
        ) {
        super.willTransition(to: newCollection, with: coordinator)
        
        switch (newCollection.horizontalSizeClass, newCollection.verticalSizeClass) {
        case (traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass): break
        default: setUpImages(traitCollection: newCollection)
        }
    }
    
    private func setUpImages(traitCollection: UITraitCollection) {
        for subview in stackView.arrangedSubviews.dropFirst() {
            subview.isHidden = traitCollection.isCompact
        }
    }
}

private extension UITraitCollection {
    var isCompact: Bool {
        return
            [horizontalSizeClass, verticalSizeClass]
                .filter {$0 != .compact}
                .isEmpty
    }
}












