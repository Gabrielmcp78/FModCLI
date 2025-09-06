import XCTest
@testable import FModCLI

final class FModCLITests: XCTestCase {
    
    func testCLICanBeInitialized() {
        // Test that the main CLI structure can be created
        let config = FModCLIMain.configuration
        XCTAssertEqual(config.commandName, "fmodcli")
        XCTAssertEqual(config.abstract, "Apple FoundationModels CLI - Interface for Apple Intelligence on-device models")
        XCTAssertEqual(config.version, "1.0.0")
    }
    
    func testRunCommandConfiguration() {
        let config = RunCommand.configuration
        XCTAssertEqual(config.commandName, "run")
        XCTAssertEqual(config.abstract, "Generate text using Apple Intelligence")
    }
    
    func testModelsCommandConfiguration() {
        let config = ModelsCommand.configuration
        XCTAssertEqual(config.commandName, "models")
        XCTAssertEqual(config.abstract, "List available models")
    }
    
    func testExamplesCommandConfiguration() {
        let config = ExamplesCommand.configuration
        XCTAssertEqual(config.commandName, "examples")
        XCTAssertEqual(config.abstract, "Show usage examples")
    }
    
    @available(macOS 26.0, *)
    func testSimpleFModCallerAvailability() {
        // Test that SimpleFModCaller functions exist and can be called
        // Note: These tests verify the API structure, not actual functionality
        // since FoundationModels requires real Apple Intelligence hardware
        
        Task { @MainActor in
            // These should not crash, even if they print error messages
            SimpleFModCaller.listModels()
            await SimpleFModCaller.run(prompt: "test", output: "text")
        }
    }
}