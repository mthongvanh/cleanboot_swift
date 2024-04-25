
/// # ServiceError
/// Error returned by Service Locators
public struct ServiceError: Error {
    
    public init(kind: ErrorKind) {
        self.kind = kind
    }
    
    public enum ErrorKind {
        case duplicateService
        case notFound
        case invalidParameters
    }
    
    let kind: ErrorKind
}
