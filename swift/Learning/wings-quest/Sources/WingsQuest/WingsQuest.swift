import Foundation

// Determines if the player earns bonus points.
// Returns true if a power-up is active and the player is touching an eagle.
func bonusPoints(powerUpActive: Bool, touchingEagle: Bool) -> Bool {
  return powerUpActive && touchingEagle
}

// Determines if the player scores points.
// Returns true if the player is either touching a power-up or a seed.
func score(touchingPowerUp: Bool, touchingSeed: Bool) -> Bool {
  return touchingPowerUp || touchingSeed
}

// Determines if the player loses the game.
// Returns true if the player is touching an eagle without a power-up being active.
func lose(powerUpActive: Bool, touchingEagle: Bool) -> Bool {
  return touchingEagle && !powerUpActive
}

// Determines if the player wins the game.
// Returns true if the player has picked up all seeds and is not in a losing condition.
func win(HasPickedUpAllSeeds: Bool, powerUpActive: Bool, touchingEagle: Bool) -> Bool {
  return HasPickedUpAllSeeds && !lose(powerUpActive: powerUpActive, touchingEagle: touchingEagle)
}
