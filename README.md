# Stars NFT Generation and Data Hosting

![Cover](/coverimage.png)

This repository contains a real example of the workflow for:

1. Algorithmically generating a set of NFTs wiith tiered rarity structure.

2. Hosting the image and metadata for the generated NFT set on Github.

3. Creating an ERC721 smart contract in Solidity with contract metadata linked to Github hosting.

## Requirements
- [Ruby](https://www.ruby-lang.org/en/)
- [GIMP](https://www.gimp.org/), [Photoshop](https://www.adobe.com/products/photoshop.html), or some any PNG photo editing program.
- [Remix](https://remix.ethereum.org/)(Online), or [Truffle](https://www.trufflesuite.com/truffle)(CLI) for deployment and minting.

## Notes Before Using This Code
-  If you want to create AND HOST your own NFT set using this code: FORK THIS REPOSITORY.
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
    
Attributes can also have rarities dependent on the <b> Gender </b> attribute, like how female Stars can have earrings or lipstick on their mouths.

Once you have your attributes planned out, open the PNG image editing tool of your choice (GIMP is free and works perfectly for this use case), and create a blank canvas or project of size 56 pixels by 56 pixels. It's time to start drawing assets! After you've finished, export all of your .png files to the 'parts' directory, with subfolders for each attribute just like how the example is set up. <b> Don't forget to make the background transparent when exporting. </b>

### Step 2

Generate

### Step 3

Change contract values, deploy contract on Remix

## DISCLAIMER

Something about money and NFTs and blockchain etc.
