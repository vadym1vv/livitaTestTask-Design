//
//  IconEnum.swift
//  LivitaTask
//
//  Created by Vadym Vasylaki on 15.06.2026.
//

import Foundation

enum IconEnum: String {
    case chevronUpChevronDown, resize, save, topBarPerson, after1, after2, after3, after4, after5, after6, before1, before2, before3, before4, before5, before6, arrowRight, iconArrow
    
    var icon: String {
        return self.rawValue
    }
}
