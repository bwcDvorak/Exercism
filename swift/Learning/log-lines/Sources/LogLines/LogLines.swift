import Foundation

// TODO: define the 'LogLevel' enum, its `init`, and its `shortFormat` method
enum LogLevel: String {
    case trace, debug, info, warning, error, fatal, unknown
    
    init(_ myLine: String ) {
        switch myLine {
        case _ where (myLine.contains("TRC")):
            self = .trace
        case _ where (myLine.contains("DBG")):
            self = .debug
        case _ where (myLine.contains("INF")):
            self = .info
        case _ where (myLine.contains("WRN")):
            self = .warning
        case _ where (myLine.contains("ERR")):
            self = .error
        case _ where (myLine.contains("FTL")):
            self = .fatal
        default: self = .unknown
        }
    }
    
    func shortFormat(message: String) -> String {
        let returnMessage = (message.components(separatedBy: "]: "))
        
        switch self {
        case .trace:
            return "0:" + (returnMessage.last ?? "")
        case .debug:
            return "1:" + (returnMessage.last ?? "")
        case .info:
            return "4:" + (returnMessage.last ?? "")
        case .warning:
            return "5:" + (returnMessage.last ?? "")
        case .error:
            return "6:" + (returnMessage.last ?? "")
        case .fatal:
            return "7:" + (returnMessage.last ?? "")
        default: return "42:" + (returnMessage.last ?? "")
        }
    }
}
