//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC1155.sol";

abstract contract ERC1155Burnable is ERC1155 {
    
    modifier onlyAuthorized(address account) {
        require(
            account == msg.sender ||
            isApprovedForAll(account, msg.sender)
        );
        _;
    }

    function burn(
        address account,
        uint id,
        uint value
    ) public virtual onlyAuthorized(account) {
        _burn(account, id, value);
    }

    function burnBatch(
        address account, 
        uint[] memory ids,
        uint[] memory values
    ) public virtual onlyAuthorized(account) {
        _burnBatch(account, ids, values);
    }
}