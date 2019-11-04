//
//  ISSTaskCell.swift
//  ScrumDeskHomeWork
//
//  Created by Эмиль Шалаумов on 04.11.2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import UIKit

/// Task Collection View Cell
class ISSTaskCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    let descLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 5 // set this value to avoid this label being longer than source cell view
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        // shadow setup
        self.layer.cornerRadius = 4
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        // set labels' frame
        titleLabel.frame = CGRect(x: 4, y: 2, width: frame.width - 8, height: 20)
        descLabel.frame = CGRect(x: 4, y: 26, width: frame.width - 8, height: 0)
        
        // delimiter line
        let lineView = UIView(frame: CGRect(x: 2, y: 24, width: frame.width - 4, height: 1))
        lineView.backgroundColor = .black
        
        contentView.addSubview(descLabel)
        contentView.addSubview(lineView)
        contentView.addSubview(titleLabel)
    }
    
    // this function calls from collectionView cellForItem to put values into text fields
    func setupCell(with task: ISSTask) {
        titleLabel.text = task.title
        descLabel.text = task.desc
        descLabel.sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
