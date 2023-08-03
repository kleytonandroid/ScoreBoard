//
//  TeamManagerService.swift
//  ScoreBoard
//
//  Created by Kleyton Santos on 01/08/23.
//

import SwiftUI

enum TeamManagerServiceError: Error {
    case maximumCharactersNotAllowed
    case minimumCharactersAllowed
}

protocol TeamManagerServiceProtocol: AnyObject {
    /// Returns the current team name
    func getTeamName() -> String
    /// Returns the current team color
    func getTeamColor() -> UIColor
    /// Returns the current score
    func getTeamScore() -> Int
    /// Adds one point to the team
    func addScore()
    /// Removes one point to the team
    func removeScore()
    /// Resets the team score to zero
    func resetScore()
    /// Change current team color
    func changeColor(_ newColor: UIColor)
    /// Change current team name
    func changeTeamName(_ newTeamName: String) throws
}

final class TeamManagerService: TeamManagerServiceProtocol {

    private struct Constants {
        static let totalCharacters = 16
    }
    /// Properties
    private var team: Team

    /// initializer
    init(teamName: String, teamColor: UIColor, initialScore: Int = 0) {
        self.team = Team(
            name: teamName,
            color: teamColor,
            score: initialScore
        )
    }

    func getTeamName() -> String {
        team.name
    }
    func getTeamColor() -> UIColor {
        team.color
    }

    func getTeamScore() -> Int {
        team.score
    }

    func addScore() {
        team.score += 1
    }

    func removeScore() {
        team.score -= 1
    }

    func resetScore() {
        team.score = 0
    }

    func changeColor(_ newColor: UIColor) {
        team.color = newColor
    }

    func changeTeamName(_ newTeamName: String) throws {
        guard !newTeamName.trimmingCharacters(in: .whitespaces).isEmpty else {
            throw TeamManagerServiceError.minimumCharactersAllowed
        }
        guard isConformMaximumCharacters(value: newTeamName) else {
            throw TeamManagerServiceError.maximumCharactersNotAllowed
        }
        team.name = newTeamName
    }

    private func isConformMaximumCharacters(value: String) -> Bool {
        value.count < Constants.totalCharacters
    }
}
