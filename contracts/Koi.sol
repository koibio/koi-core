pragma solidity >=0.4.21 <0.7.0;
import "../node_modules/zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract Koi is StandardToken {
    string public name = "KOI.BIO";
    string public symbol = "KOI";
    uint8 public decimals = 18;
    uint256 public INITIAL_SUPPLY = 60000000000000000000000000;
    constructor() public{
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
    }
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function _burn(address account, uint256 amount) internal {
        require(account != address(0), "ERC20: burn from the zero address");
        uint256 accountBalance = balances[account];
        require(accountBalance >= amount, "ERC20: burn amount exceeds balance");
        balances[account] = accountBalance - amount;
        totalSupply_ -= amount;

        emit Transfer(account, address(0), amount);
    }
}
