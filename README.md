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

![Star1](/images/star-12x6.png) ![Star2](/images/star-98x6.png)

Above are some examples of generated stars in this Stars NFT Collection, specifically Star 12 and Star 98.

After the Ruby program finished, you will be left with 3 folders:

    - gen - This folder contains all PNG images from the set generated at 1x size (56 px by 56 px by default.)
    - img - This folder contains all PNG images from the set generated at 6x size (336 px by 336 px by default.)
    - descriptions - This folder contains all metadata descriptions in text files for each generated image.
    
Congratulations! You just generated your first set of NFT token images. In order to host them for access by the blockchain, publish them <b>here to your fork</b> or create a new repository.

### Step 3

Change contract values, deploy contract on Remix

## DISCLAIMER

Something about money and NFTs and blockchain etc.
