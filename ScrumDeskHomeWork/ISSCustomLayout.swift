//
//  ISSCustomLayout.swift
//  ScrumDeskHomeWork
//
//  Created by Эмиль Шалаумов on 04.11.2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import UIKit

/// Class implements logic of custom layout for desk collection view
class ISSCustomLayout: UICollectionViewLayout {
    
    private let cellPadding: CGFloat = 8
    
    private var layoutAttributes: [UICollectionViewLayoutAttributes] = []
    
    private var contentHeight: CGFloat = 0
    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        guard let collectionView = collectionView else {
            return
        }
        
        // clean attributes array because I had errors when moved cell between diff. sections
        layoutAttributes.removeAll()
        // set to zero for making content size always equal to max number of cells in column
        contentHeight = 0
        
        let columnWidth = contentWidth / CGFloat(collectionView.numberOfSections)
        
        for section in 0..<collectionView.numberOfSections {
            var yOffset: CGFloat = 0
            for item in 0..<collectionView.numberOfItems(inSection: section) {
                let indexPath = IndexPath(item: item, section: section)
                let columnHeight = columnWidth / 1.1
                
                let frame = CGRect(x: columnWidth * CGFloat(section), y: yOffset, width: columnWidth, height: columnHeight)
                
                let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
                
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                
                attributes.frame = insetFrame
                layoutAttributes.append(attributes)
                
                contentHeight = max(contentHeight, frame.maxY)
                
                yOffset += columnHeight
            }
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
        
        // Итеративно проходим по массиву аттрибутов и ищем элементы внутри rect
        for attributes in layoutAttributes {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return layoutAttributes[indexPath.item]
    }
}
