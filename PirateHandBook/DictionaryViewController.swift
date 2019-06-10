//
//  DictionaryViewController.swift
//  PirateHandBook
//
//  Created by Myo Set Paing on 6/10/19.
//  Copyright © 2019 Myo Set Paing. All rights reserved.
//

import UIKit

final class DictionaryViewController: UITableViewController {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        modalPresentationStyle = .popover
        popoverPresentationController!.delegate = self
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(dissmissModal)
        )
        
        let backgroundImageView = UIImageView(image: #imageLiteral(resourceName: "bg-parchment"))
        backgroundImageView.contentMode = .center
        tableView.backgroundView = backgroundImageView
    }
    
    @objc private func dissmissModal() {
        dismiss(animated: true)
    }
}

extension DictionaryViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        switch (traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
        case (.compact, .compact): return .fullScreen
        default: return .none
        }
    }
    
    func presentationController(
        _ controller: UIPresentationController,
        viewControllerForAdaptivePresentationStyle _: UIModalPresentationStyle
        ) -> UIViewController? {
        return UINavigationController(rootViewController: controller.presentedViewController)
    }
}

















