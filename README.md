# MG3012 - Assignment 2: PSL Fan Vote dApp

**Course:** Blockchain Technology for Business (MG3012)
**Student:** Muhammad Bilal - 24I-5526
**Instructor:** Dr. Usama Arshad

## Project Description
**PSL Fan Vote** is a mini decentralized application (dApp) where fans vote for their favourite
PSL team. A Solidity smart contract on the **Sepolia testnet** stores the votes (one vote per wallet),
and a simple HTML/CSS/JavaScript page (using **ethers.js** and **MetaMask**) shows live results with
animated bars and a crown for the current leader.

## Contract Details
| Item | Value |
|------|-------|
| Network | Sepolia Testnet |
| Contract Address | `0x4476b947d2754f2d6896d733d7a74175952f980d` |
| Etherscan | https://sepolia.etherscan.io/address/0x4476b947d2754f2d6896d733d7a74175952f980d |

## Smart Contract Functions (`SmartContract.sol`)
| Function | Type | Description |
|----------|------|-------------|
| `vote(uint256 teamId)` | Write | Cast your vote (one vote per wallet) |
| `setPollOpen(bool)` | Write | Owner only - open or close the poll |
| `getResults()` | Read | Returns all team names and their vote counts |
| `getTotalVotes()` | Read | Returns the total number of votes |
| `hasUserVoted(address)` | Read | Checks if a wallet has already voted |

## Project Structure
```
├── SmartContract.sol
├── index.html
├── style.css
├── README.md
└── screenshots/
```

## Setup Instructions
1. **Install MetaMask** and switch to the **Sepolia** network. Get free test ETH from a Sepolia faucet.
2. Open [Remix IDE](https://remix.ethereum.org), create `SmartContract.sol` and paste the code.
3. Compile with Solidity `0.8.20` or higher.
4. In *Deploy & Run*, choose **Injected Provider - MetaMask**, then click **Deploy** and confirm in MetaMask.
5. Copy the deployed contract address.
6. Open `index.html` and replace `0x4476b947d2754f2d6896d733d7a74175952f980d` with your contract address.
7. Run the page with a local server (MetaMask works best this way), for example:
   ```
   python -m http.server 8000
   ```
   then open `http://localhost:8000` in a browser that has MetaMask.
8. Click **Connect MetaMask**, then press **Vote** next to a team and confirm in MetaMask. The results bars update automatically.

## Technologies Used
- Solidity (Remix IDE)
- HTML, CSS, JavaScript
- ethers.js v6
- MetaMask and Sepolia testnet
