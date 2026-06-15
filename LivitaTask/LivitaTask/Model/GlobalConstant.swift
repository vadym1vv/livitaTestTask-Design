//
//  GlobalConstant.swift
//  LivitaTask
//
//  Created by Vadym Vasylaki on 15.06.2026.
//

import Foundation

struct GlobalConstant {
    static let mocData: [DesignModel] = [
        DesignModel(title: "Redesign", description: "Refresh your space with a new\ninterior look", imgBefore: IconEnum.before1.icon, imgAfter: IconEnum.after1.icon),
        DesignModel(title: "Sketch to Render", description: "Refresh your space with a new\ninterior look", imgBefore: IconEnum.before2.icon, imgAfter: IconEnum.after2.icon),
        DesignModel(title: "Design Transfer", description: "Refresh your space with a new\ninterior look", imgBefore: IconEnum.before3.icon, imgAfter: IconEnum.after3.icon),
        DesignModel(title: "Decor Staging", description: "Refresh your space with a new\ninterior look", imgBefore: IconEnum.before4.icon, imgAfter: IconEnum.after4.icon),
        DesignModel(title: "Text to design", description: "Refresh your space with a new\ninterior look", imgBefore: IconEnum.before5.icon, imgAfter: IconEnum.after5.icon),
        DesignModel(title: "Upscale", description: "Refresh your space with a new interior\nlook", imgBefore: IconEnum.before6.icon, imgAfter: IconEnum.after6.icon)
    ]
}
