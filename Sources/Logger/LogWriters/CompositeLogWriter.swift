/// A logger that logs to multiple loggers at once.
public final class CompositeLogWriter: LogWriterProtocol, Sendable {
    private let writers: [any LogWriterProtocol]
    
    
    public init(composing writers: [any LogWriterProtocol]) {
        self.writers = writers
    }
    
    
    public func log(_ severity: LogSeverity, _ message: String) {
        for writer in writers {
            writer.log(severity, message)
        }
    }
}
