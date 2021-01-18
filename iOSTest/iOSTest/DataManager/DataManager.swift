//
//  DataManager.swift
//  iOSTest
//
//  Created by Elhadad MALIDI on 18/01/2021.
//

import Foundation

class DataManager {
    
    func resetCache() {
        UserDefaults.standard.set(nil, forKey: "MovableViewDatas")
    }
    
    func loadMovableViewDatas() -> [MovableViewData]? {
        if let datas = UserDefaults.standard.object(forKey: "MovableViewDatas") as? Data {
            if let movableViewsDatas = try? JSONDecoder().decode([MovableViewData].self, from: datas) {
                return movableViewsDatas
            }
        }
        return nil
    }
    
    func saveMovableViewDatas(with movableViewDatas: [MovableViewData]) {
        if let encoded = try? JSONEncoder().encode(movableViewDatas) {
            UserDefaults.standard.set(encoded, forKey: "MovableViewDatas")
        }
    }
}
