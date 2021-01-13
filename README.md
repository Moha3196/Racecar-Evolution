# Racecar-Evolution
The goal for this assignment is to utilize a neural network along with a genetic algorithm
to have a population of racecars evolve and choose better and better routes around a racetrack.

These racecars move around, depending on signals from their sensors - located in front of each racecar.

The sensors detect the color of the background and the racecars turn accordingly - that's how they know which way to go.

# Upon running the program / initial generation
When the program is started, the population of racecars is created in a specified spot. They then start to move with their constant speed, and in the direction their sensors tell them to turn.

While a car is inside the bounds of the race track, it's body will remain black. If it starts going counter clockwise around the track, then it becomes progressively more green, until it is fully green. These racecars have done well, which is what the green indicates.

If the racecar, however, goes outside the track, the body sensor starts becoming red. This indicates a bad racecar, which is useful for figuring out which cars should not be chosen for the next generation.

# Moving forward (literally and metaphorically)
Since green represents a racecar doing well, and red represents a car doing not-so-well, the color signifies a well-wired brain, i.e. some good weights and biases in the racecars neural network. These can be taken and used in future cars, in order to essentially duplicate good cars, thereby removing bad cars.

This form of evolution is heavily dependent on a good car spawning, and if a good car has a few minor flaws, all the following cars will have them as well. Therefore the program needs to have a way of changing these weights and biases a little on it's own. That's were mutation comes in. 

Mutation is important for variation in the cars, but it shouldn't be common. Otherwise the good cars will tend to disappear, due to weights that became worse after a mutation.


