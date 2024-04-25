//
//  mapper.swift
//
//
//  Created by Michael Thongvanh on 4/24/24.
//

import Foundation

public protocol Mapper<Model, Entity> {
    
    associatedtype Model
    associatedtype Entity
    
    func fromEntity(entity: Entity) -> Model
    func toEntity(model: Model) -> Entity
}
