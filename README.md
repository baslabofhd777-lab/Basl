# Basl

Smart contracts repository containing modernized Solidity contracts.

## Contracts

### APENFT.sol
- Full ERC-20 token implementation
- Name: `APENFT` | Symbol: `NFT` | Decimals: `6`
- Includes pause/unpause functionality (owner only)
- Solidity `^0.8.20`

### Pausable.sol
- `Ownable` + `Pausable` base contracts
- Access control and emergency pause mechanism

### TimelockToken.sol
- Token timelock contract
- Releases tokens to a beneficiary after a specified time

## Usage

```solidity
// Deploy APENFT with initial supply (e.g. 1_000_000_000)
APENFT token = new APENFT(1_000_000_000);

// Pause transfers (owner only)
token.pause();

// Unpause
token.unpause();
```

## License
Apache-2.0
