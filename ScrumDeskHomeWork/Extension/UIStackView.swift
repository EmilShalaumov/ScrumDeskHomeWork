//
//  UIStackView.swift
//  ScrumDeskHomeWork
//
//  Created by Эмиль Шалаумов on 04.11.2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import UIKit

extension UIStackView {
    
    /// Set stack view background color
    ///
    /// - Parameter color: background color
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
