//
//  view_model.swift
//
//
//  Created by Michael Thongvanh on 4/22/24.
//

import Foundation
import SwiftUICore

public typealias OnModelReady<ViewModelType> = (ViewModelType) -> Void
public typealias OnModelUpdate<ViewModelType> = (ViewModelType) -> Void

@available(iOS 17.0, *)
@Observable
open class ViewModel<ViewModelType> {
    
    public init(
        onModelReady: OnModelReady<ViewModelType>?,
        onModelUpdate: OnModelUpdate<ViewModelType>?
    ) {
        self.onModelReady = onModelReady
        self.onModelUpdate = onModelUpdate
        
        self.loadState = .initialized
        
        if #available(iOS 13.0, *) {
            Task.init {
                await prepareData()
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    /// called after the data has been prepared
    public var onModelReady: OnModelReady<ViewModelType>?
    
    /// called whenever the model has updated some values
    public var onModelUpdate: OnModelUpdate<ViewModelType>?
    
    /// represents the state of loading data or performing an operation
    public var loadState: ViewModelLoadState = .initialized
    
    public var loading: Bool {
        get {
            loadState == .loading
        }
    }
    
    open func prepareData() async {
        // update state before performing async operation
        loadState = .loading
        
        // if any errors are encountered update the state
        loadState = .error
        
        // update state after completing preparations
        loadState = .ready
        
        if (loadState == .ready || loadState == .readyNoData) {
            if let readyCallback = onModelReady {
                DispatchQueue.main.async {
                    readyCallback(self as! ViewModelType)
                }
            }
        }
    }
    
    open func updateLoadState(loadState: ViewModelLoadState) {
        self.loadState = loadState
        
        guard let modelUpdate = onModelUpdate else {
            return;
        }
        
        DispatchQueue.main.async {
            modelUpdate(self as! ViewModelType)
        }
    }
}

/** #Represents the data loading state
     
     // default value when a view model is created
     case initialized
     
     // view model is performing an async operation
     case loading
     
     // view model has loaded data without errors
     case ready
     
     // view model has loaded data without error but no data was found
     case readyNoData
     
     // view model encountered an error
     case error
*/
public enum ViewModelLoadState {
    
    // default value when a view model is created
    case initialized
    
    // view model is performing an async operation
    case loading
    
    // view model has loaded data without errors
    case ready
    
    // view model has loaded data without error but no data was found
    case readyNoData
    
    // view model encountered an error
    case error
}
