// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title PSL Fan Vote
/// @notice MG3012 Assignment 2 - a live on-chain poll: vote for your favourite team
contract PSLVoting {
    string[] private teamNames;                 // list of teams
    uint256[] private voteCounts;               // votes for each team (same order)
    mapping(address => bool) private voted;     // has this wallet already voted?
    uint256 private totalVotes;                 // total votes cast
    address public owner;                       // deployer of the contract
    bool public pollOpen = true;                // owner can close/open the poll

    event Voted(address indexed voter, uint256 indexed teamId);

    constructor() {
        owner = msg.sender;
        string[6] memory names = [
            "Lahore Qalandars",
            "Karachi Kings",
            "Islamabad United",
            "Peshawar Zalmi",
            "Quetta Gladiators",
            "Multan Sultans"
        ];
        for (uint256 i = 0; i < names.length; i++) {
            teamNames.push(names[i]);
            voteCounts.push(0);
        }
    }

    // WRITE function 1: cast your vote (one vote per wallet)
    function vote(uint256 teamId) public {
        require(pollOpen, "Poll is closed");
        require(!voted[msg.sender], "You already voted");
        require(teamId < teamNames.length, "Invalid team");

        voted[msg.sender] = true;
        voteCounts[teamId] += 1;
        totalVotes += 1;
        emit Voted(msg.sender, teamId);
    }

    // WRITE function 2: owner opens or closes the poll
    function setPollOpen(bool _open) public {
        require(msg.sender == owner, "Only owner can do this");
        pollOpen = _open;
    }

    // READ function 1: get all team names and their votes
    function getResults() public view returns (string[] memory names, uint256[] memory counts) {
        return (teamNames, voteCounts);
    }

    // READ function 2: total number of votes
    function getTotalVotes() public view returns (uint256) {
        return totalVotes;
    }

    // READ function 3: check if a wallet has voted
    function hasUserVoted(address user) public view returns (bool) {
        return voted[user];
    }
}
