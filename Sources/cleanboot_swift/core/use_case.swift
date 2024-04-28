//
//  use_case.swift
//
//
//  Created by Michael Thongvanh on 4/22/24.
//

import Foundation

public protocol UseCase<ResultType, Parameters> {
    associatedtype ResultType
    associatedtype Parameters
    
    @available(iOS 13.0.0, *)
    func execute(params: Parameters) async throws -> UseCaseResult<ResultType>
}

public enum UseCaseResult<ResultType> {
    case success(ResultType)
    case failure(Error)
}
