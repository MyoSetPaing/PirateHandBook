//
//  WeatherViewController.swift
//  PirateHandBook
//
//  Created by Myo Set Paing on 6/7/19.
//  Copyright © 2019 Myo Set Paing. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet private var stackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let images = [#imageLiteral(resourceName: "weather-sun"), #imageLiteral(resourceName: "weather-windy"), #imageLiteral(resourceName: "weather-thunderstorm")]
        let imageViews: [UIImageView] = images.map {image in
            let imageView = UIImageView(image: image)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }
        
        let spacerGuides =  (0..<images.count - 1 ).map{_ in UILayoutGuide()}
    
        imageViews.forEach(stackView.addArrangedSubview)
        spacerGuides.forEach(view.addLayoutGuide)
        
        
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(
                withVisualFormat: """
          |[leftGap]\
          -[monday(fullWidth@849)]-(bigGap)\
          -[tuesday(smaller@849)]-(gap)-[wednesday(smaller@849)]\
          -(gap)-[rightGap(==leftGap)]|
          """,
                options: .alignAllBottom,
                metrics: {
                    let imageWidth = imageViews[0].image!.size.width
                    let gap: CGFloat = 8
                    return [
                        "fullWidth": imageWidth,
                        "smaller": imageWidth * 0.7,
                        "bigGap": gap * 3,
                        "gap": gap
                    ]
            }(),
                views: Dictionary(
                    uniqueKeysWithValues: [
                        (["monday", "tuesday", "wednesday"], imageViews),
                        (["leftGap", "rightGap"], spacerGuides)
                        ].flatMap {(keys, values: [Any]) in zip(keys, values)}
                )
                )
                + [imageViews[0].centerYAnchor.constraint(equalTo: view.centerYAnchor)]
                + imageViews.map {$0.heightAnchor.constraint(equalTo: $0.widthAnchor)}
        )
    
    }
    
}
    



