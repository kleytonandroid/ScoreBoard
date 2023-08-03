//
//  ScoreBoardTests.swift
//  ScoreBoardTests
//
//  Created by Kleyton Santos on 01/08/23.
//

import XCTest
import SwiftUI
@testable import ScoreBoard

final class TeamManagerServiceTest: XCTestCase {

    func test_init() {
        // Given
        let teamName = "test"
        let teamColor = UIColor.blue

        // When
        let sut = TeamManagerService(teamName: teamName, teamColor: teamColor)

        // Then
        XCTAssertEqual(sut.getTeamName(), teamName)
        XCTAssertEqual(sut.getTeamColor(), teamColor)
        XCTAssertEqual(sut.getTeamScore(), 0)
    }

    func test_addScore_shouldAddOnePointToScore() {
        // Given
        let initialScore = 2
        let sut = makeSut(initialScore: initialScore)

        // When
        sut.addScore()

        // Then
        XCTAssertEqual(sut.getTeamScore(), initialScore + 1)
    }

    func test_removeScore_shouldRemovesOnePointToScore() {
        // Given
        let initialScore = 2
        let sut = makeSut(initialScore: initialScore)

        // When
        sut.removeScore()

        // Then
        XCTAssertEqual(sut.getTeamScore(), initialScore - 1)
    }

    func test_changeTeamColor_withTeamBlue_shouldChangeToRed() {
        // Given
        let initialColor = UIColor.blue
        let sut = makeSut(teamColor: initialColor)

        // When
        sut.changeColor(.red)

        // Then
        XCTAssertEqual(sut.getTeamColor(), .red)
    }

    func test_changeTeamName_shouldChangeTeamName() throws {
        // Given
        let initialTeamName = "initial team name"
        let sut = makeSut(teamName: initialTeamName)

        // When
        let newTeamName = "New Team Name"
        try sut.changeTeamName(newTeamName)

        // Then
        XCTAssertEqual(sut.getTeamName(), newTeamName)
    }

    func test_changeTeamName_withMoreThan16Characters_shouldThrowAnError() throws {
        // Given
        let initialName = "initial teamName"
        let sut = makeSut(teamName: initialName)

        // When
        let newMoreThan16Characters = "12345678901234567"
        XCTAssertThrowsError(try sut.changeTeamName(newMoreThan16Characters)) { error in

            // Then
            XCTAssertEqual(error as! TeamManagerServiceError, TeamManagerServiceError.maximumCharactersNotAllowed)
            XCTAssertEqual(sut.getTeamName(), initialName)
        }
    }

    func test_changeTeamName_withEmptyValue_shouldThrownAnError() {
        // Given
        let initialName = "initial teamName"
        let sut = makeSut(teamName: initialName)

        // When
        let emptyName = ""
        XCTAssertThrowsError(try sut.changeTeamName(emptyName)) { error in

            // Then
            XCTAssertEqual(error as! TeamManagerServiceError, TeamManagerServiceError.minimumCharactersAllowed)
            XCTAssertEqual(sut.getTeamName(), initialName)
        }
    }

    func test_changeTeamName_withWhiteSpacesValue_shouldThrownAnError() {
        // Given
        let initialName = "initial teamName"
        let sut = makeSut(teamName: initialName)

        // When
        let whiteSpaceName = " "
        XCTAssertThrowsError(try sut.changeTeamName(whiteSpaceName)) { error in

            // Then
            XCTAssertEqual(error as! TeamManagerServiceError, TeamManagerServiceError.minimumCharactersAllowed)
            XCTAssertEqual(sut.getTeamName(), initialName)
        }
    }

    /// Constructor System Under Test
    func makeSut(
        teamName: String = "test",
        teamColor: UIColor = .blue,
        initialScore: Int = 0
    ) -> TeamManagerServiceProtocol {
        TeamManagerService(
            teamName: teamName,
            teamColor: teamColor,
            initialScore: initialScore
        )
    }
}
