//
//  UIView.swift
//  iTunesPodcast
//
//  Created by Osaretin Uyigue on 7/3/23.
//

import UIKit

extension UIView {
    
    @discardableResult
    func anchorToEdges(top: NSLayoutYAxisAnchor? = nil,
                       leading: NSLayoutXAxisAnchor? = nil,
                       bottom: NSLayoutYAxisAnchor? = nil,
                       trailing: NSLayoutXAxisAnchor? = nil,
                       padding: UIEdgeInsets = .zero,
                       size: CGSize = .zero) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach { $0?.isActive = true }
        
        return anchoredConstraints
    }
    
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        anchorToEdges(top: superview?.topAnchor,
                      leading: superview?.leadingAnchor,
                      bottom: superview?.bottomAnchor,
                      trailing: superview?.trailingAnchor,
                      padding: padding)
    }
}

struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}

func createLabel(_ title: String, font: UIFont, textColor: UIColor, numOfLines: Int = 0) -> UILabel {
    let label = UILabel()
    label.text = title
    label.font = font
    label.textColor = textColor
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = numOfLines
    return label
}

func handleSetUpAttributedText(titleString: String, subString: String, mainColor: UIColor, mainfont: UIFont, secondColor: UIColor, subFont: UIFont) -> NSMutableAttributedString {
    
    let mainAttributes = [NSAttributedString.Key.foregroundColor : mainColor, NSAttributedString.Key.font : mainfont]
    let mainAttributedText = NSMutableAttributedString(string: titleString, attributes: mainAttributes)
    
    let subAttributes = [NSAttributedString.Key.foregroundColor : secondColor, NSAttributedString.Key.font : subFont]
    
    let subAttributedText = NSMutableAttributedString(string: subString, attributes: subAttributes)
    
    mainAttributedText.append(subAttributedText)
    
    
    return mainAttributedText
}
