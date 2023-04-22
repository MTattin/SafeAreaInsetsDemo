//
//  ViewControllerType.swift
//  SafeAreaInsetsDemo
//

enum ViewControllerType {
    ///
    case ignoreSafeAreaTrue
    ///
    case ignoreSafeAreaFalse
    ///
    case useSafeAreaRegion
    
    var title: String {
        switch self {
        case .ignoreSafeAreaTrue:
            return "Safe Area Insets 無効"
        case .ignoreSafeAreaFalse:
            return "Safe Area Insets 有効"
        case .useSafeAreaRegion:
            return "safeAreaRegions iOS 16.4以上"
        }
    }
}
