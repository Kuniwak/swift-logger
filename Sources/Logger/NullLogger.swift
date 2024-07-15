public final actor NullLogger: LoggerProtocol {
    public init() {}
    
    
    nonisolated public func trace(_ s: String = #function) {
        // Do nothing
    }
    
    nonisolated public func debug(_ message: String) {
        // Do nothing
    }
    
    nonisolated public func info(_ message: String) {
        // Do nothing
    }
    
    nonisolated public func notice(_ message: String) {
        // Do nothing
    }
    
    nonisolated public func error(_ message: String) {
        // Do nothing
    }
    
    nonisolated public func fault(_ message: String) {
        // Do nothing
    }
}
