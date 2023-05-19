import Foundation
import UIKit
//Создаю enum AssetsColor
enum AssetsColor {
    case myColor
}
//Расширяю UIColor
extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor? {
        switch name {
        case .myColor:
            return UIColor(named: "ColorSet")
        }
    }
}

