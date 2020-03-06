# BBCitySearch
Github URL: https://github.com/279Shubham/BBCitySearch

# Architecture:
1. MVP, as there are only two controllers. MapViewcontroller is doing a little work so code has been written in controller      though protocol for presenter is created for the same. *Lack of time.
2. Singletong pattern is used to store the data after parsing the json. Its heavy on memory but helps in time performance but decreases the space performance.

# Data Structure:
Trie is used to save the cities data locally, which enhances the word search speed. Please see the comments in Trie.swift file for further explanation.

# Performance:
1. Very basic use of OperationQueue: with concurrent max operation set to 1, cancelling the operations if new search operation is added to queue just to ensure that no race conditions are created. Though there is still some small possibility of race condition since operations class is used without subclassing(used with BlockOperation) and the cancel functionality can still fail because of already known reasons with Cancel method of Operation class. Given more time this can be fine tuned to get rid of the hihgly unlikey edge cases too.
2. The initial parsing takes some time(~ 4 seconds) to convert falt list of cities to Trie.
3. The space complexity is not taken into consideration while creating the solution. Trie is heavy on space requirement.

# Unit testing:
1. The code is fully testable but unit testing is not very exhaustive. Since there were only 2 days to finish the task. :( Code is written in protocol oriented way so it is well testable. Also the json is loaded in app delegate synchronously so tests are also slow. Separate app delegate can be written for testing also which will make the unit tests faster to launch and without invoking the UI at all. Also as mentioned earlier using json for the testing can be improved by having mock data set for testing.

2. For the sake of this assignment the city json is only used to test trie implemenation which obviously can be improved by having teh separate mock json or test data so that negative cases can also be tested.

# Testing:
Code is tested on simulator, iOS-13, 

# Orientation Supported:
Vertical and horizontal

# Git branches: 
Only master branch for now.

