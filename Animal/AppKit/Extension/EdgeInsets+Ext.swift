//
//  EdgeInsets+Ext.swift
//  Animal
//
//  Created by Duy Ha on 20/10/24.
//

import Foundation
import SwiftUI

extension EdgeInsets {
    init(all: CGFloat) {
        self.init(top: all, leading: all, bottom: all, trailing: all)
    }

    init(horizontal: CGFloat, vetical: CGFloat) {
        self.init(top: vetical, leading: horizontal, bottom: vetical, trailing: horizontal)
    }
}
