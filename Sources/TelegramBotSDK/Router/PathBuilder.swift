//
// PathBuilder.swift
//
// This source file is part of the Telegram Bot SDK for Swift (unofficial).
//

import Foundation

public protocol PathRepresentableHandler {
    var handler: Handler { get }
    func asPath() -> Path
}

public struct CommandHandler: PathRepresentableHandler {
    public let command: Command
    public var handler: Handler

    public func asPath() -> Path {
        Path(.command(command), handler)
    }

    init(_ command: Command, handler: @escaping Handler) {
        self.command = command
        self.handler = handler
    }

    init(_ commandString: String, handler: @escaping Handler) {
        self.command = Command(commandString)
        self.handler = handler
    }
}

public struct CommandsHandler: PathRepresentableHandler {
    public let commands: [Command]
    public var handler: Handler

    public func asPath() -> Path {
        Path(.commands(commands), handler)
    }

    public init(@CommandBuilder builder: () -> [Command], handler: @escaping Handler) {
        self.commands = builder()
        self.handler = handler
    }
}

public struct ContentTypeHandler: PathRepresentableHandler {
    public let contentType: ContentType
    public var handler: Handler

    public func asPath() -> Path {
        Path(contentType, handler)
    }
}

@resultBuilder
public struct CommandBuilder {
    public static func buildBlock(_ components: String...) -> [Command] {
        components.map { Command($0) }
    }

    public static func buildBlock(_ components: Command...) -> [Command] {
        components
    }
}

@resultBuilder
public struct PathBuilder {
    public static func buildBlock(_ components: PathRepresentableHandler...) -> [Path] {
        components.map { $0.asPath() }
    }
}

@resultBuilder
public struct RouterBuilder {
    public static func buildBlock(_ components: Router...) -> [Router] {
        components
    }
}
