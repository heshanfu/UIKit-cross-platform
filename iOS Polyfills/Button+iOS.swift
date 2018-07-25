//
//  Button.swift
//  FlowkeyPlayer
//
//  Created by Geordie Jay on 17.05.17.
//  Copyright © 2017 flowkey. All rights reserved.
//

import UIKit

/**
 This class abstracts away the objc syntax for touch handling.

 The SDL Version is a direct subclass of UIView, so don't assume
 that `Button` will always be a subclass of `UIButton`.
 */
#if os(iOS)
public class Button: UIButton {
    public var onPress: (() -> Void)? {
        didSet {
            if onPress != nil {
                // The docs say it is safe to add the same target/action multiple times:
                addTarget(self, action: #selector(handleOnPress(_:)), for: .touchUpInside)
            } else {
                removeTarget(self, action: #selector(handleOnPress(_:)), for: .touchUpInside)
            }
        }
    }

    @objc private func handleOnPress(_ sender: Button) {
        sender.onPress?()
    }
}
#endif
