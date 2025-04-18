//
//  CGFloat+Ext.swift
//  Animal
//
//  Created by Duy Ha on 20/10/24.
//

import Foundation
import UIKit
import SwiftUI

public enum AppCornerRadius: CGFloat {
    /// 60
    case extraExtraLarge = 60
    
    /// 24
    case large = 24
    
    /// 16
    case medium = 16
    
    /// 12
    case small = 12
    
    /// 8
    case xsmall = 8
    
    /// 4
    case x2small = 4
}

public enum AppSpacing: CGFloat {
    /// 110
    case extra3Large = 110
    
    /// 64
    case extra2Large = 64
    
    /// 40
    case extraLarge = 40
    
    /// 38
    case e2Large = 38
    
    /// 36
    case e1Large = 36
    
    /// 32
    case large32 = 32
    
    /// 28
    case large28 = 28
    
    /// 26
    case large = 26
    
    /// 24
    case xlarge = 24
    
    /// 20
    case mediumLarge = 20
    
    /// 16
    case medium = 16
    
    /// 12
    case xmedium = 12
    
    /// 8
    case small = 8
    
    /// 6
    case xssmall = 6
    
    /// 4
    case xsmall = 4
    
    /// 2
    case xxsmall = 2
}

public enum AppSizing: CGFloat {
    case x2Huge = 96
    case xHuge = 80
    case extraLarge = 72
    case huge = 64
    case x3xlarge = 56
    case x3large = 48
    case x2Large = 40
    case xLarge = 32
    case x1Large = 28
    case large = 24
    case mediumlarge = 20
    case medium = 16
    case small = 12
    case xSmall = 8
    case x2small = 4
    case x3small = 2
    case x4small = 1
}

public enum AppButtonHeight: CGFloat {
    case large = 52
    case xlarge = 48
    case medium = 40
    case small = 36
    case xsmall = 24
}

public enum AppIconSize: CGFloat {
    /// 144
    case extraExtraLarge = 144
    
    /// 128
    case extraLarge = 128
    
    /// 96
    case large = 96
    
    /// 74
    case xlarge = 74
    
    /// 48
    case medium = 48
    
    /// 40
    case small = 40
    
    /// 36
    case xsmall = 36
    
    /// 32
    case x2small = 32
    
    /// 28
    case x3small = 28
    
    /// 24
    case tiny = 24
    
    /// 20
    case nsTiny = 20
    
    /// 18
    case xsTiny = 18
    
    /// 16
    case xTiny = 16
}

public enum AppSizer: CGFloat {
    /// 64
    case sizer2Xl = 64
    
    /// 40
    case xl = 40
    
    /// 32
    case lg = 32
    
    /// 24
    case mlg = 24
    
    /// 16
    case md = 16
    
    /// 8
    case sm = 8
    
    /// 4
    case xs = 4
    
    /// 2
    case sizer2Xs = 2
}

public enum AppRadius: CGFloat {
    /// 32
    case lg = 32
    
    /// 24
    case mlg = 24
    
    /// 16
    case md = 16
    
    /// 8
    case sm = 8
    
    /// 4
    case xs = 4
}

public extension CGFloat {
    static func getCornerRadius(_ value: AppCornerRadius) -> CGFloat {
        return value.rawValue
    }
    
    static func getSpacing(_ value: AppSpacing) -> CGFloat {
        return value.rawValue
    }
    
    static func sizing(_ value: AppSizing) -> CGFloat {
        return value.rawValue
    }
    
    static func getIconSize(_ value: AppIconSize) -> CGFloat {
        return value.rawValue
    }
    
    static func sizer(_ value: AppSizer) -> CGFloat {
        return value.rawValue
    }
    
    static func radius(_ value: AppRadius) -> CGFloat {
        return value.rawValue
    }
    
    static func buttonHeight(_ value: AppButtonHeight) -> CGFloat {
        return value.rawValue
    }
    
    static var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    static var iPhoneMaxWidth: CGFloat {
        return 640
    }
    
    static var safeAreaEdgeInsets: EdgeInsets {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = scene.windows.first else {
            return EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        }
        
        let insets = window.safeAreaInsets
        return EdgeInsets(
            top: insets.top,
            leading: insets.left,
            bottom: insets.bottom,
            trailing: insets.right
        )
    }
}
