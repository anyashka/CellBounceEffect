//
//  TableViewCell.swift
//  CellBounceEffect
//
//  Created by Anna-Maria Shkarlinska on 30/09/16.
//  Copyright © 2016 Anna-Maria Shkarlinska. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var deleteView: UIView!
    
    class var cellIdentifier: String {
        return "TableViewCell"
    }
    
    override func awakeFromNib() {
        deleteView.hidden = true
    }
    
    func animateDeleteView() {
        deleteView.hidden = false
        UIView.animateKeyframesWithDuration(1, delay: 0.6, options: .LayoutSubviews, animations: { [weak self] in
            guard let safeSelf = self, let viewToAnimate = safeSelf.containerView else { return }
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0.5, animations: { viewToAnimate.frame.origin.x -= 84 })
            UIView.addKeyframeWithRelativeStartTime(0.55, relativeDuration: 0.25, animations: { viewToAnimate.frame.origin.x += 84 })
            UIView.addKeyframeWithRelativeStartTime(0.7, relativeDuration: 0.2, animations: { viewToAnimate.frame.origin.x -= 44 })
            UIView.addKeyframeWithRelativeStartTime(0.9, relativeDuration: 0.2, animations: { viewToAnimate.frame.origin.x += 44 })
            }, completion: { [ weak self] completed in
                guard completed == true, let safeSelf = self, let viewToHide = safeSelf.deleteView else { return }
                viewToHide.hidden = true
            })
    }
}