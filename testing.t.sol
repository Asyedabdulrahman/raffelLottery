// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {DeployRaffle} from "../../script/DeployRaffle.s.sol";
import {Raffle} from "../../src/Raffle.sol";
import {HelperConfig} from "../../script/HelperConfig.s.sol";
import {Test, console} from "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";
import {StdCheats} from "forge-std/StdCheats.sol";
import {VRFCoordinatorV2Mock} from "../mocks/VRFCoordinatorV2Mock.sol";

contract RaffleTest is StdCheats, Test {
    Raffle public raffle;
    HelperConfig public helperConfig;

    uint64 subscriptionId;
    bytes32 gasLane;
    uint256 automationUpdateInterval;
    uint256 raffleEntranceFee;
    uint32 callbackGasLimit;
    address vrfCoordinatorV2;


    address public PLAYER = makeAddr("player");
    uin256 public AMOUNT = 10 ether;
   
    function setUp() external {
        DeployRaffle deployer = new DeployRaffle();
        (raffle, helperConfig) = deployer.run();
        //
         vm.deal(PLAYER,AMOUNT); //assign amount to player(address)
       //
        (
            enterancFee,
            interval,
            vrfCoordinator,
            gasLane,
            subscription,
            callbackGasLimit
         ) = helperConfig.activeNetworkConfig();
    }
 function testRaffleInitializesInOpenState() public view {
        assert(raffle.getRaffleState() == Raffle.RaffleState.OPEN);
    }
    
    }

   










