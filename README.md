# Stars NFT Generation and Data Hosting

![Cover](/coverimage.png)

Stars NFT

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

Get one [here](https://starsnft.herokuapp.com/),  or check out the [Discord](https://discord.com/invite/pCEdUjqPtk) to join the Stars community!

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

This repository contains a real example of the workflow for:

1. Algorithmically generating a set of NFTs wiith tiered rarity structure.

2. Hosting the image and metadata for the generated NFT set on Github.

3. Creating an ERC721 smart contract in Solidity with contract metadata linked to Github hosting.

## Requirements
- [Ruby](https://www.ruby-lang.org/en/)
- [GIMP](https://www.gimp.org/), [Photoshop](https://www.adobe.com/products/photoshop.html), or some any PNG photo editing program.
- [Remix](https://remix.ethereum.org/)(Online), or [Truffle](https://www.trufflesuite.com/truffle)(CLI) for deployment and minting.
- [MetaMask](https://metamask.io/)

## Notes Before Using This Code
-  If you want to create AND HOST your own NFT set here using this code: FORK THIS REPOSITORY.
-  If you want to create your own NFT set and NOT host it here, or if you simply just want to experiment:  CLONE THIS REPOSITORY.

## Usage

Once dependencies are all installed, enter the <i> starsnft </i> directory with <i> cd starsnft </i> after cloning/forking. This is the main working directory for this project and is where all commands should be entered. Below are the steps for replicating this project.

### Step 1: Creating Attributes

![Part1](/parts/bg/bg1.png) ![Part2](/parts/body/body3.png) ![Part3](/parts/eyes/eyes4.png) ![Part4](/parts/mouth/mouth3.png) ![Part9](/parts/nose/nose2.png) ![Part7](/parts/shoes/shoes4.png)
![Part5](/parts/hat/hat1.png) ![Part6](/parts/socks/socks2.png)  ![Part8](/parts/accessories/accessories4.png) 

(OPTIONAL) Run cleaning script <i> bash clean.sh </i> to empty directories and give you a fresh project to work with.

The first step to creating a set of generated NFT avatars with tiered rarity structure is coming up with A.  a list of attributes and B. their rarities within the collection.  For example, the above set of images shows the attributes for the Stars NFT Collection. Listed out,  these attributes are:

    - Gender
    - Background
    - Body
    - Eyes
    - Mouth
    - Nose
    - Shoes
    - Hat (optional)
    - Socks (optional)
    - Accessories (optional)
    
For each 'optional'  attribute, there are rarities for these attributes to occur such as a Hat being 30% likely to appear, Socks being 40% likely to appear and a 20% chance of having an Accessory.

Within the attributes, there are also rarities, like:

    - Gender - 70% male, 30% female
    - Background - 60% (red, orange, yellow), 25% (green, blue), 15% (yellow)
    - Body - All 25%
    - etc.
    
Attributes can also have rarities dependent on the <b> Gender </b> attribute, like how female Stars can have earrings or lipstick on their mouths. Attribute rarities and the code for assigning attributes to specific genders or other attribute instances can be found in the <i> generate.rb </i>  file.

Once you have your attributes planned out, it's time to start drawing assets! 

Open the PNG image editing tool of your choice (GIMP is free and works perfectly for this use case), and create a blank canvas or project of size 56 pixels by 56 pixels. 

After you've finished, export all of your .png files to the 'parts' directory, with subfolders for each attribute just like how the example is set up. <b> Don't forget to make the background transparent when exporting. </b>

### Step 2

Assuming that you've created your image assets and organized it accordingly (or are using the provided 'parts' directory), you can now generate your images!

Execute the command <i> ruby generate.rb  </i>  in the main project directory and read the output for descriptions.

![Star2](/images/star-98x6.png) ![Star1](/images/star-121x6.png)

Above are some examples of generated stars in this Stars NFT Collection, specifically Star 98 and Star 121.

After the Ruby program finished, you will be left with 3 folders and a file:

    - gen - This folder contains all PNG images from the set generated at 1x size (56 px by 56 px by default).
    - img - This folder contains all PNG images from the set generated at 6x size (336 px by 336 px by default).
    - descriptions - This folder contains all metadata descriptions in text files for each generated image.
    - metadata.json - This file contains contract-level metadata info for the whole collection.
    
Congratulations! You just generated your first set of NFT token images. In order to host them for access by the blockchain, publish them <b>here to your fork</b> or create a new repository.

### Step 3

Once your images are generated and uploaded, it's time to move to the blockchain!

Make sure your <i> metadata.json </i> file is filled out with the correct parameters (name, description, image, and external_url are straightforward), namely your ETH wallet address to recieve royalties on sales, and the seller_basis_fee of 250, which corresponds to a 2.5% royalty fee deposited to your wallet for every transaction. All of these values can and should be changed as needed.

Open the <i> SampleContract.sol </i> file in a text editor of your choice. For the simple, base ERC721 contract, only the constructor, baseURI(), and contractURI() methods need to be changed for deployment.

Constructor: change the contract name and symbol to match what you want.
baseURI(): change the return string to match the location of your hosted 'descriptions' folder.
contractURI(): change the return string to match the location of your hosted 'metadata.json' file.

### DEPLOYMENT

REMIX:

- Open up [Remix](https://remix.ethereum.org/) and import SampleContract.sol (or create your own there) in the first (highest) tab.
- Once all the code and values in the contract file are set, navigate to the second tab down to compile it. Remix does have an auto-compile option, but just make sure that it's compiled anyways.
- After compilation, you are ready for deployment!
    - If you want to deploy to a testnet first, you'll need some test ETH. Head over to a Rinkeby or Ropsten faucet to get some ether to experiment with.
    - If you want to deploy straight to mainnet, you'll need ~0.5 ETH in your wallet to cover gas fees for deployment and minting.
- Move to the third tab on the page, select your environment as Injected Web3 (make sure you are on the correct network in Metamask!), select your contract file,  and press <i> Deploy </i>.
- After confirming with Metamask, your deployed contract and its methods should appear under the 'Deployment' section.
- Click the 'safeMint' button in <i> red </i> to mint your first NFT!
- If you made it to this step with no issues, you've just deployed your first smart contract and minted your first NFT!
- Visit https://testnets.opensea.io/assets/CONTRACT_ADDRESS/0 for Rinkeby/Ropsten or https://opensea.io/assets/CONTRACT_ADDRESS/0 for Mainnet to view your NFT.

Truffle:

- [Truffle Deployment and Minting Tutorial](https://forum.openzeppelin.com/t/create-an-nft-and-deploy-to-a-public-testnet-using-truffle/2961)

Happy creating!

## DISCLAIMER

This project, in potentally involving the real Ethereum mainnet blockchain, DOES involve real finances if you choose to do so. This repository was created solely for educatoinal purposes, and its creators take  financial responsibility over money YOU put in to the blockchain for NFT projects. Do your own research, always be aware of what you're clicking and agreeing to on any site, and invest your money wisely.
