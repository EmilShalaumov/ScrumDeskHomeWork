//
//  ISSTask.swift
//  ScrumDeskHomeWork
//
//  Created by Эмиль Шалаумов on 04.11.2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import Foundation

/// Task model representation
class ISSTask {
    let title: String
    let desc: String
    
    init(title: String, desc: String) {
        self.title = title
        self.desc = desc
    }
}
