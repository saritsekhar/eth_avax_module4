// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    constructor() ERC20("Degen", "DGN") Ownable( msg.sender ) {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function decimals() override public pure returns (uint8) {
        return 0;
    }

    function transferDegen(address _receiver, uint amount) external {
        require(balanceOf(msg.sender) >= amount, "You don't have enough tokens");
        transfer(_receiver, amount);
    }
        
    function burnDegen(uint amount) external {
        require(balanceOf(msg.sender) >= amount, "You can't burn more tokens than you own");
        burn(amount);
    }

    function yourBalance() external view returns (uint) {
        return balanceOf(msg.sender);
    }

    function gameStore() public pure returns (string memory) {
        return "1. Wheel spin [0 -> 1000] = 200 \n 2. Get 2x token = 100";
    }

    function redeemTokens(uint _userChoice) external {
        require(_userChoice > 0 && _userChoice <= 2, "Invalid selection");

        if (_userChoice == 1) {
            require(balanceOf(msg.sender) >= 200, "Insufficient balance for this redemption");
            uint amount = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % 500;
            _transfer(msg.sender, owner(), 200);
            _mint(msg.sender, amount);
        } else if (_userChoice == 2) {
            require(balanceOf(msg.sender) >= 100, "Insufficient balance for this redemption");
            _transfer(msg.sender, owner(), 100);
            _mint(msg.sender, 200);
        }
    }
}
