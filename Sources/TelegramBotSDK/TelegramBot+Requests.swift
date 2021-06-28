//
// TelegramBot+Requests.swift
//
// This source file is part of the Telegram Bot SDK for Swift (unofficial).
//

import Foundation
import Dispatch

extension TelegramBot {
	/// Perform synchronous request.
	/// - Returns: Decodable  on success. Nil on error, in which case `lastError` contains the details.
	internal func requestSync<TResult>(_ endpoint: String, _ parameters: [String: Encodable?] = [:]) -> TResult? where TResult: Decodable {
		
		var retval: TResult!
		let sem = DispatchSemaphore(value: 0)
		let queue = DispatchQueue.global()
		requestAsync(endpoint, parameters, queue: queue) { [weak self]
			(result: TResult?, error: DataTaskError?) in
			retval = result
			self?.lastError = error
			sem.signal()
		}
		RunLoop.current.waitForSemaphore(sem)
		return retval
	}
	
	/// Perform synchronous request.
	/// - Returns: Decodable  on success. Nil on error, in which case `lastError` contains the details.
	internal func requestSync<TResult>(_ endpoint: String, _ parameters: [String: Encodable?]?...) -> TResult? where TResult: Decodable {
		return requestSync(endpoint, mergeParameters(parameters))
	}
	
	/// Perform asynchronous request.
	/// - Returns: Decodable  on success. Nil on error, in which case `error` contains the details.
    internal func requestAsync<TResult>(_ endpoint: String, _ parameters: [String: Encodable?] = [:], queue: DispatchQueue = DispatchQueue.main, completion: ((_ result: TResult?, _ error: DataTaskError?) -> ())?) where TResult: Decodable {
        startDataTaskForEndpoint(endpoint, parameters: parameters, resultType: TResult.self) {
			rawResult, error in
            var resultValid = false
            if (rawResult as? TResult?) != nil {
                resultValid = true
            }
			queue.async() {
                completion?(resultValid ? rawResult as! TResult? : nil, error)
			}
		}
	}
	
	/// Perform asynchronous request.
	/// - Returns: Decodable  on success. Nil on error, in which case `error` contains the details.
	internal func requestAsync<TResult>(_ endpoint: String, _ parameters: [String: Encodable?]?..., queue: DispatchQueue = DispatchQueue.main, completion: ((_ result: TResult?, _ error: DataTaskError?) -> ())?) where TResult: Decodable {
		requestAsync(endpoint, mergeParameters(parameters), queue: queue, completion: completion)
	}
	
	/// Perform asynchronous request.
	/// - Returns: array of Decodable  on success. Nil on error, in which case `error` contains the details.
	internal func requestAsync<TResult>(_ endpoint: String, _ parameters: [String: Encodable?] = [:], queue: DispatchQueue = DispatchQueue.main, completion: ((_ result: [TResult]?, _ error: DataTaskError?) -> ())?) where TResult: Decodable {
        startDataTaskForEndpoint(endpoint, parameters: parameters, resultType: [TResult].self) {
			rawResult, error in
            var resultValid = false
            if (rawResult as? [TResult]?) != nil {
                resultValid = true
            }
            completion?(resultValid ? rawResult as! [TResult]? : nil, error)
			//queue.async() {
            //    completion?(resultValid ? rawResult as! [TResult]? : nil, error)
			//}
		}
	}
	
	/// Perform asynchronous request.
	/// - Returns: array of Decodable  on success. Nil on error, in which case `error` contains the details.
	internal func requestAsync<TResult>(_ endpoint: String, _ parameters: [String: Encodable?]?..., queue: DispatchQueue = DispatchQueue.main, completion: ((_ result: [TResult]?, _ error: DataTaskError?) -> ())?) where TResult: Decodable {
		return requestAsync(endpoint, mergeParameters(parameters), queue: queue, completion: completion)
	}
	
	/// Merge request parameters into a single dictionary. Nil parameters are ignored. Keys with nil values are also ignored.
	/// - Returns: merged parameters.
	private func mergeParameters(_ parameters: [ [String: Encodable?]? ]) -> [String: Encodable?] {
		var result = [String: Encodable?]()
		for p in parameters {
			guard let p = p else { continue }
			p.forEach { key, value in
				guard let value = value else { return }
				result.updateValue(value, forKey: key)
			}
		}
		return result
	}    
}
