pragma solidity ^0.8.0;

contract TrumpPikachuTraits {
    uint constant BASE_CHANCE = 5; // Base chance percentage for animated background and body color cycling

    // Seed levels for different trait combinations
    uint constant SEED_LEVEL_0 = 1000; // Plain Pikachu with animation
    uint constant SEED_LEVEL_1 = 3000; // Pikachu with 10% chance of animated background
    uint constant SEED_LEVEL_2 = 10000; // Clean Pikachu - No Traits
    uint constant SEED_LEVEL_3 = 30000; // Pikachu with Eyewear, Hat, or Clothes - 1/3 Chance - 10% Chance of Body Animation
    uint constant SEED_LEVEL_4 = 60000; // Pikachu with any two Traits, 1/3 chance - 20% Chance of Body Animation
    uint constant SEED_LEVEL_5 = 120000; // Pikachu with all traits, 50% Chance per trait, 25% chance of animated body and background
    uint constant SEED_LEVEL_6 = 999999999; // Pikachu with all traits, 50% Chance per trait, Guaranteed Animated Background and Body

    // Define trait probabilities
    uint constant TRAIT_PROBABILITY = 33; // Probability percentage for each trait

    // Function to determine trait combination based on seed value
    function getTraitCombination(uint seed) public pure returns (string memory) {
        if (seed < SEED_LEVEL_0) {
            return "Plain Pikachu with animation";
        } else if (seed < SEED_LEVEL_1) {
            return "Pikachu with 10% chance of animated background";
        } else if (seed < SEED_LEVEL_2) {
            return "Clean Pikachu - No Traits";
        } else if (seed < SEED_LEVEL_3) {
            return "Pikachu with Eyewear, Hat, or Clothes";
        } else if (seed < SEED_LEVEL_4) {
            return "Pikachu with any two Traits";
        } else if (seed < SEED_LEVEL_5) {
            return "Pikachu with all traits";
        } else if (seed < SEED_LEVEL_6) {
            return "Pikachu with all traits and guaranteed animated background and body";
        } else {
            return "Unknown";
        }
    }

    // Function to determine if animated background and body animation are present based on seed value
    function hasAnimatedBackgroundAndBodyAnimation(uint seed) public pure returns (bool, bool) {
        bool hasAnimatedBackground = (seed < SEED_LEVEL_1) || (seed >= SEED_LEVEL_5);
        bool hasBodyAnimation = (seed >= SEED_LEVEL_3 && seed < SEED_LEVEL_4) || (seed >= SEED_LEVEL_5);
        return (hasAnimatedBackground, hasBodyAnimation);
    }
}
