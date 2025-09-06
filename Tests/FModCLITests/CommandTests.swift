import XCTest
import ArgumentParser
@testable import FModCLI

final class CommandTests: XCTestCase {
    
    func testRunCommandParsing() throws {
        // Test basic argument parsing for RunCommand
        let args = ["Hello world"]
        let command = try RunCommand.parse(args)
        XCTAssertEqual(command.prompt, "Hello world")
        XCTAssertEqual(command.output, "text") // default value
    }
    
    func testRunCommandWithOutput() throws {
        // Test RunCommand with output format option
        let args = ["--output", "json", "Test prompt"]
        let command = try RunCommand.parse(args)
        XCTAssertEqual(command.prompt, "Test prompt")
        XCTAssertEqual(command.output, "json")
    }
    
    func testRunCommandWithShortOutput() throws {
        // Test RunCommand with short output format option
        let args = ["-o", "json", "Test prompt"]
        let command = try RunCommand.parse(args)
        XCTAssertEqual(command.prompt, "Test prompt")
        XCTAssertEqual(command.output, "json")
    }
    
    func testMainCommandParsing() throws {
        // Test that the main command structure exists
        // Note: Main command parsing with subcommands is complex in ArgumentParser
        // so we just test the configuration exists
        let config = FModCLIMain.configuration
        XCTAssertTrue(config.subcommands.contains { $0 == RunCommand.self })
        XCTAssertTrue(config.subcommands.contains { $0 == ModelsCommand.self })
        XCTAssertTrue(config.subcommands.contains { $0 == ExamplesCommand.self })
    }
    
    func testModelsCommandParsing() throws {
        // Test models command parsing
        let command = try ModelsCommand.parse([])
        XCTAssertNotNil(command)
    }
    
    func testExamplesCommandParsing() throws {
        // Test examples command parsing  
        let command = try ExamplesCommand.parse([])
        XCTAssertNotNil(command)
    }
    
    func testInvalidArguments() {
        // Test that invalid arguments throw appropriate errors
        XCTAssertThrowsError(try RunCommand.parse([])) // Missing prompt
        XCTAssertThrowsError(try RunCommand.parse(["--invalid-flag", "prompt"]))
    }
}