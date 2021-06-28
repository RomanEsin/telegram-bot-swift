//
// NSRunLoop+Utils.swift
//
// This source file is part of the Telegram Bot SDK for Swift (unofficial).
//

import Foundation
import Dispatch

public extension RunLoop {
    func waitForSemaphore(_ sem: DispatchSemaphore) {
		repeat {
            run(mode: RunLoop.Mode.default, before: Date(timeIntervalSinceNow: 0.01))
		} while .success != sem.wait(timeout: DispatchTime.now())
	}
}
