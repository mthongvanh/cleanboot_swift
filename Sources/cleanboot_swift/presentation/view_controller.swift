//
//  File.swift
//  
//
//  Created by Michael Thongvanh on 4/25/24.
//

import Foundation

public protocol BaseViewController {
    associatedtype T
    func onModelUpdate(viewModel: T)
    func onModelReady(viewModel: T)
}
