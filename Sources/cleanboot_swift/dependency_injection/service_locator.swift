
/// Alias for factory constructor parameters
public typealias FactoryParameters = ([String : AnyObject]?, [String : AnyObject]?)?
/// Service factory constructory that accepts optional factory parameters
public typealias FactoryConstructor<T: Any> = (FactoryParameters?) throws -> T

/// # ServiceLocator
/// A type that can register other types which can be retrieved via generic type or identifier
public protocol ServiceLocator {
    
    // Registers a single instance of a class which is always returned by the service locator instance
    func registerSingleton<T: Any>(instance: T, identifier: String?) throws
    
    // Registers an instance that is instantiated upon first use
    func registerLazySingleton<T: Any>(
        instantiator: @escaping () -> T,
        type: T.Type,
        identifier: String?
    ) throws
    
    // Registers a factory that takes two optional parameters used at instantiation
    func registerFactory<T: Any>(
        instantiator: @escaping FactoryConstructor<T>,
        type: T.Type,
        identifier: String?
    ) throws
    
    // Locate and return a service
    func get<T: Any>(
        serviceType: T.Type,
        identifier: String?,
        parameters: FactoryParameters?
    ) throws -> T
}
