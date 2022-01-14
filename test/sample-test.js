const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Greeter", function () {
  it("Should return the new greeting once it's changed", async function () {
    const Greeter = await ethers.getContractFactory("CoinFlip");
    const greeter = await Greeter.deploy("Hello, world!");
    await greeter.deployed();

  });
});
