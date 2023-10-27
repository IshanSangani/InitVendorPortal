// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract eRationToken is ERC20("eRation Token", "eT"), Ownable {
    // Address to receive 100 tokens
    address public specialAddress = 0xdE142fe3Db7D1883d7709EB40a8333be2B063C25;

    constructor(address initialOwner) Ownable(initialOwner) {
        // Mint initial tokens to the contract creator
        _mint(msg.sender, 10 * 10**18);
    }

    function mintFifty() public onlyOwner {
        _mint(msg.sender, 50 * 10**18);
    }

    // Set an account's balance to 0
    function makeBalanceZero(address account) public onlyOwner {
        _burn(account, balanceOf(account));
    }

    // Original function: Mint 100 tokens to the specified special address
    function mintToSpecialAddress() public onlyOwner {
        _mint(specialAddress, 100 * 10**18);
    }

    // New function: Transfer 100 tokens from owner to the specified special address
    function transferToSpecialAddress() public onlyOwner {
        _transfer(_msgSender(), specialAddress, 100 * 10**18);
    }
}
