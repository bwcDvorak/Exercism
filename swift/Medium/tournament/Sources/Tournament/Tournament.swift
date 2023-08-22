//Solution goes in Sources

import Foundation

class Tournament {
    
    /// A struct to represent each team's statistics.
    struct TeamStats {
        var name: String
        var matchesPlayed = 0
        var wins = 0
        var draws = 0
        var losses = 0
        
        /// Computed property to calculate the total points for a team.
        var points: Int {
            return wins * 3 + draws
        }
    }
    
    /**
     Generates a tally based on the given input.
     
     - Parameter input: A string representation of the match results.
     - Returns: A formatted string tally of the results.
     */
    func tally(_ input: String) -> String {
        // Dictionary to store each team's stats, keyed by team name.
        var teams: [String: TeamStats] = [:]
        
        // Splitting the input into individual lines (matches).
        let lines = input.split(separator: "\n")
        for line in lines {
            // Splitting each line into its components: team1, team2, and result.
            let components = line.split(separator: ";")
            let team1 = String(components[0])
            let team2 = String(components[1])
            let result = String(components[2])
            
            // Initializing teams in the dictionary if they haven't been seen before.
            if teams[team1] == nil {
                teams[team1] = TeamStats(name: team1)
            }
            if teams[team2] == nil {
                teams[team2] = TeamStats(name: team2)
            }
            
            // Updating the team's stats based on the match result.
            switch result {
            case "win":
                teams[team1]?.matchesPlayed += 1
                teams[team1]?.wins += 1
                
                teams[team2]?.matchesPlayed += 1
                teams[team2]?.losses += 1
                
            case "loss":
                teams[team1]?.matchesPlayed += 1
                teams[team1]?.losses += 1
                
                teams[team2]?.matchesPlayed += 1
                teams[team2]?.wins += 1
                
            case "draw":
                teams[team1]?.matchesPlayed += 1
                teams[team1]?.draws += 1
                
                teams[team2]?.matchesPlayed += 1
                teams[team2]?.draws += 1
                
            default: break
            }
        }
        
        // Sorting teams first by points and then alphabetically for teams with equal points.
        let sortedTeams = teams.values.sorted { (team1, team2) -> Bool in
            if team1.points == team2.points {
                return team1.name < team2.name
            }
            return team1.points > team2.points
        }
        
        // Constructing the final result string.
        var result = "Team                           | MP |  W |  D |  L |  P"
        for team in sortedTeams {
            result += "\n\(team.name.padding(toLength: 31, withPad: " ", startingAt: 0))|  \(team.matchesPlayed) |  \(team.wins) |  \(team.draws) |  \(team.losses) |  \(team.points)"
        }
        
        return result
    }
}
