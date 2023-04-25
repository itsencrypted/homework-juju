// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract ArrayDeletion {
    uint256[] private s_items;
    uint256 public s_randomSeed;

    constructor() {
        for (uint256 i = 0; i < 12; i++) {
            s_items.push(i);
        }
        // Set the random seed
        s_randomSeed = block.timestamp;
    }

    function deleteItem(uint256 index) public {
        uint256[] memory m_items = s_items;
        require(index < m_items.length, "Invalid index");
        if (index == m_items.length - 1) {
            s_items.pop();
        } else {
            // Move the last element into the deleted spot
            m_items[index] = m_items[m_items.length - 1];
            // Remove the last element
            s_items.pop();
        }
    }

    function deleteRandomItem() public {
        // Generate a random index within the bounds of the array
        uint256 index = uint256(
            keccak256(abi.encodePacked(s_randomSeed, block.timestamp))
        ) % s_items.length;
        s_randomSeed++;
        deleteItem(index);
    }

    function getArray(uint256 index) public view returns (uint256) {
        return s_items[index];
    }
}
