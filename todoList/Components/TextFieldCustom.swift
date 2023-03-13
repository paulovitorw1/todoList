//
//  TextFieldCustom.swift
//  todoList
//
//  Created by Paulo Vitor on 10/03/23.
//

import UIKit

final class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 8,
        left: 16,
        bottom: 8,
        right: 16
    )
    
    var textFieldHeight: CGFloat = 48 {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width, height: textFieldHeight)
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}


