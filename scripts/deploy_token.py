from brownie import accounts, config, ReconquistaToken;

initial_supply = 100000000000000000000 #100 gwei

def main():
        account = accounts.add(config["wallet"]["from_key"])
        ReconquistaToken.deploy(initial_supply,{"from":account}) 
