# Reconquista token

## 1. Fundamentals 


- [P. Collins video ](https://www.youtube.com/watch?v=8rpir_ZSK1g&t=743s) using brownie, python, solidity
- [Kader Calls ](https://www.youtube.com/watch?v=EeUqqZoaUlw) how to deploy a token on Eth and add LP
- [Ali Solanki ](https://www.youtube.com/watch?v=2SWH1DQITVw)How to give VALUE to a Cryptocurrency? Liquidity Pools Rug Pull Scam

### 1.0 Takeaways

*ERC20 tokes are contracts that follow the ERC20 standard, which represent a specific **fungible token**. 
There are backward compatible upgrades to ERC20 such as Chainlink, which is a ERC677 token.*


### 1.1 Deploy a ERC20 token locally

1. Install [brownie](https://eth-brownie.readthedocs.io/en/stable/install.html)

2. Install [ganache-cli](https://www.npmjs.com/package/ganache-cli)

3. Initialize a new brownie repository 

    ```
    brownie init
    ```
4. Create the token inside the *contract* folder and copy the [ERC20 standard](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/dad73159df3d3053c72b5e430fa8164330f18068/contracts/token/ERC20/ERC20.sol)  

5. Compile
    ``` 
    brownie compile 
    ```
6. Run a ganache-cli
7. Deploy it
    
    1. Create a **deploy.py** script inside the script folder
    - from brownie: import **accounts, config** and our **Token Contract**
    - define a main function where we have to get
        - the owner account
        - invoke the **deploy** function of our ERC20 token and we supply to it A) the initial amount of tokens (e.g. 100), its name and symbol B) the owner address
    2. run the script
        ```
        brownie run deploy.py
        ```


### 1.2 Deploy a ERC20 token on Goerli Testnet

1. Create .env file with 
    - an **infura project ID**
    - metamask **private key** (remember your .gitignore)
2. Create the token contract:
    1. Import openzeppelin ERC20 contract
    2. Create an inherited token: 

    ``` solidity 
    contract GLDToken is ERC20 {
        constructor(uint256 initialSupply) ERC20("Name here", "Symbol here") {
            _mint(msg.sender, initialSupply);
        }
    ```

3. Create a ```brownie.config.yaml``` file to explicity route the library
    - dependencies: get the desired package
    - remapping @openzeppeling
    - dotenv 
    - add wallet private key

4. Refactor the contract script adjusting:
    - the constructor (remove token name/symbol)

5. Refactor the deploy script adjusting:
    - the account variable that is now taken from ```brownie.config``` file 
    - add **publishSource=True** into the constructor arguments to verify the contract on etherscan 
6.  Load the .env variables in local environment 
    ```
    source .env 
    ```
    or the equivalent
     ```
    . .env 
    ```
7.  Compile
    ``` 
    brownie compile 
    ```
8.  Run
    ``` 
    brownie run scripts/deploy.py --network goerli 
    ```
9. Import the tokens in metamask


### 1.3 Add our token to the Liquidity Pool