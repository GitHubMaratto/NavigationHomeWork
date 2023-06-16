import Foundation
import UIKit

//MARK: - Enum

//Создаю enum AssetsColor
enum AssetsColor {
    case myColor
}


//MARK: - Extention

//Расширяю UIColor
extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor? {
        switch name {
        case .myColor:
            return UIColor(named: "ColorSet")
        }
    }
}

