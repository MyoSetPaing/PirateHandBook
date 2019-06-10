//
//  MenuViewController.swift
//  PirateHandBook
//
//  Created by Myo Set Paing on 6/7/19.
//  Copyright © 2019 Myo Set Paing. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet private var buttonStackView: UIStackView!
    private var weatherViewController: WeatherViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if traitCollection.horizontalSizeClass == .regular {
            addWeatherView()
            weatherViewController?.view.isHidden = false
        }
    }
    
    override func willTransition(
        to newCollection: UITraitCollection,
        with coordinator: UIViewControllerTransitionCoordinator
        ) {
        super.willTransition(to: newCollection, with: coordinator)
        
        switch newCollection.horizontalSizeClass {
        case .regular:
            if newCollection.horizontalSizeClass != traitCollection.horizontalSizeClass {
                addWeatherView()
            }
        case .compact: removeWeatherView()
        case .unspecified: break
        }
        
        coordinator.animate(alongsideTransition: nil) {_ in
            self.weatherViewController?.view.isHidden = false
        }
    }
}

//MARK: private
private extension MenuViewController {
    func addWeatherView() {
        guard let weatherViewController =
            storyboard?.instantiateViewController(
                withIdentifier: String(describing: WeatherViewController.self)
                ) as? WeatherViewController
            else {return}
        
        weatherViewController.view.translatesAutoresizingMaskIntoConstraints = false
        weatherViewController.willMove(toParent: self)
        weatherViewController.view.isHidden = true
        weatherViewController.backgroundImageView.isHidden = true
        view.addSubview(weatherViewController.view)
        NSLayoutConstraint.activate([
            weatherViewController.view.centerYAnchor.constraint(equalTo: buttonStackView.centerYAnchor),
            weatherViewController.view.leadingAnchor.constraint(equalTo: buttonStackView.trailingAnchor, constant: 100)
            ])
        
        addChild(weatherViewController)
        
        setOverrideTraitCollection(
            UITraitCollection(
                traitsFrom: [
                    UITraitCollection(horizontalSizeClass: .compact),
                    UITraitCollection(verticalSizeClass: .compact)
                ]
            ),
            forChild: weatherViewController
        )
        
        self.weatherViewController = weatherViewController
    }
    
    func removeWeatherView() {
        guard let weatherViewController = weatherViewController
            else {return}
        
        weatherViewController.willMove(toParent: nil)
        weatherViewController.view.removeFromSuperview()
        weatherViewController.removeFromParent()
        self.weatherViewController = nil
    }
}
