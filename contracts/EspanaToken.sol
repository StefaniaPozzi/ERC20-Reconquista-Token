//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ReconquistaToken is ERC20{
    constructor(uint256 amount) public ERC20("ReconquistaToken","ESP"){
        _mint(msg.sender, amount);
    }
}