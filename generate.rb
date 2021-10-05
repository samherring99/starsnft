# Created by Sam Herring 2021

# Import statements

require 'fileutils'
require 'pixelart'
require 'json'

FileUtils.mkdir_p 'gen'
FileUtils.mkdir_p 'img'
FileUtils.mkdir_p 'desc'

puts "\n--------------------------- Starting NFT Generation... ---------------------------\n"

codeslist = [] # Empty variable to store combinations to prevent repetition.

# Below are case-level booleans that are triggered if NON-required attributes are selected.

hatbool = false
socksbool = false
accessoriesbool = false

#  An empty dictionary with teh counts of each image part to calculate rarities.

RARES = {
    gender: {male: 0, female: 0},
    bg: { red: 0, orange: 0, yellow: 0, green: 0, blue: 0, purple: 0 },
    body: {one: 0, two: 0, three: 0, four: 0, five: 0}, shoes: {black: 0, forces: 0, vans: 0, redconv: 0, blueconv: 0},
    mouth: {smile: 0, open: 0, redlips: 0, purplelips: 0, tongue: 0, zombie: 0},
    nose: {one: 0, two: 0, three: 0, four: 0},
    eyes: {one: 0, two: 0, three: 0, four: 0, five: 0, six: 6},
    socks: {white: 0, black: 0, rainbow: 0},
    hat: {cowboy: 0, redcap: 0, bluecap: 0, supreme: 0, wizard: 0, fez: 0},
    accessories: {glasses: 0, sunglasses: 0, cigarette: 0, earrings: 0}
    
}

PARTS = {
    # Background colors
  bg:  { required: true,
           attributes: [['Blue', 'u'],
                        ['Green', 'u'],
                        ['Orange', 'u'],
                        ['Purple', 'u'],
                        ['Red', 'u'],
                        ['Yellow', 'u']] },
  # Body types
  body:  { required: true,
           attributes: [['Body 1', 'u'],
                        ['Body 2', 'u'],
                        ['Body 3', 'u'],
                        ['Body 4', 'u'],
                        ['Body 5', 'u']] },
  # Types of shoes
  shoes:  { required: true,
      attributes: [['Black', 'u'],
                   ['AF1s', 'u'],
                   ['Checkered Vans', 'u'],
                   ['Red Converse', 'u'],
                   ['Blue Converse', 'u']] },
  #  Types of mouths
  mouth: { required: true,
           attributes: [['Black Smile',  'u'],
                        ['Black Open',    'u'],
                        ['Red Smile',           'f'],
                        ['Purple Smile',                'f'],
                        ['Tongue Out',     'u'],
                        ['Zombie Mouth', 'm']] },
  #  Types of noses
  nose:  { required: true,
           attributes: [['Nose 1',          'u'],
                        ['Nose 2', 'u'],
                        ['Nose 3',  'u'],
                        ['Nose 4', 'u']] },
  # Types of eyes
  eyes:  { required: true,
           attributes: [['Eyes 1', 'u'],
                        ['Eyes 2', 'u'],
                        ['Eyes 3', 'u'],
                        ['Eyes 4', 'u'],
                        ['Eyes 5', 'u'],
                        ['Eyes 6', 'u']] },
  # Types of socks,  if wearing.
  socks:  { required: false,
           attributes: [['Black Socks', 'u'],
                        ['White Socks', 'u'],
                        ['Rainbow Socks', 'u']] },
  # Hat type, if wearing
  hat:  { required: false, # 40 % Chance
           attributes: [['Cowboy Hat', 'u'],
                        ['Red Cap', 'u'],
                        ['Blue Cap', 'u'],
                        ['Camp Cap', 'u'],
                        ['Wizard Hat', 'm'],
                        ['Fez', 'm']] },
  #  Type of accessory, if applicable.
  accessories:  { required: false, # 20% Chance
           attributes: [['Glasses',        'u'],
                        ['Sunglasses',      'u'],
                        ['Cigarette',         'u'],
                        ['Earrings',     'f']] } # Glasses - 50%, Sunglasses - 40%, Earrings - 25%, Cigarette - 10%
}

# Main method to compose and generate an image.

def generate_star( codes )
    
    # Create 56px by 56px blank image
  star = Pixelart::Image.new( 56, 56 )

    # Iterate through parts list, add codes with codes[index] > 0 (means that this Star has this attribute and indicates which type)
    
  PARTS.each_with_index do |(key,part),i|
    code  = codes[i]
    if code != 0
      path = "./parts/#{key}/#{key}" + "#{code}" + ".png" # Location of image part in directory
      part = Pixelart::Image.read( path )
      star.compose!( part )
    end
  end
  # Return the composed image at the end.
  star
end

# Defining range variable, current code array, and a global counter.

totalrange = (1..500)
counter=0
codes=[0, 0, 0, 0, 0, 0, 0, 0, 0]

# Iterate through the range, capturinig current index.

totalrange.each_with_index do |index|
    
    # Initialzie attribute varables to empty/default.
    g_string = "Male"
    bg_index = 0
    body_index = rand(5) #  Choose a random body type.
    shoes_index = 0
    mouth_index = 0
    nose_index = 0
    eyes_index = 0
    socks_index = 0
    hat_index = 0
    accessories_index = 0
    
    #  Assign body type from random variable.
    
    if body_index == 0
        RARES[:body][:one] += 1
    elsif body_index == 1
        RARES[:body][:two] += 1
    elsif body_index == 2
        RARES[:body][:three] += 1
    elsif body_index == 3
        RARES[:body][:four] += 1
    else
        RARES[:body][:five] += 1
    end
    
    # Generate gender and background variables.
    
    gender = rand(10)
    bgvar = rand(100)
    
    # Create background rarity with random choice inside.
    
    if bgvar < 10
        bg_index = 3
        RARES[:bg][:green] += 1
    elsif bgvar < 15
        choice = rand(2)
        
        if choice == 0
            bg_index = 4
            RARES[:bg][:blue] += 1
        else
            bg_index = 5
            RARES[:bg][:purple] += 1
        end
    else
        bg_index = rand(3)
        
        if bg_index == 0
            RARES[:bg][:red] += 1
        elsif bg_index == 1
            RARES[:bg][:orange] += 1
        else
            RARES[:bg][:yellow] += 1
        end
    
    end
    
    # Gender split: Male
    
    if gender < 7
        
        RARES[:gender][:male] += 1
        
        # Calculate variable to determine mouth type rarity.

        mvar = rand(100)
        
        if mvar < 5
            mouth_index = 5
            RARES[:mouth][:zombie] += 1
        else
            if mvar < 20
                mouth_index = 4
                RARES[:mouth][:tongue] += 1
            elsif mvar < 35
                mouth_index = 0
                RARES[:mouth][:smile] += 1
            else
                mouth_index = 1
                RARES[:mouth][:open] += 1
            end
            
        end
        
        # Calculate variable to determine if wearing a hat, and if so, rarity.
        
        choicevar = rand(10)
        
        if choicevar < 4
            hvar = rand(100)
            hatbool = true
            
            if hvar < 5
                hat_index = 4
                RARES[:hat][:supreme] += 1
            elsif hvar < 10
                hat_index = 6
                RARES[:hat][:fez] += 1
            elsif hvar < 15
                hat_index = 5
                RARES[:hat][:wizard] += 1
            elsif hvar < 25
                hat_index = 1
                RARES[:hat][:cowboy] += 1
            else
                choice = rand(2)
                
                if choice == 0
                    hat_index = 2
                    RARES[:hat][:redcap] += 1
                else
                    hat_index = 3
                    RARES[:hat][:bluecap] += 1
                end
            end
        end
        
        # Calculate variable to determine if star has accessory, and if so, rarity.
        
        choicevar2 = rand(10)
        
        if choicevar2 < 2
            avar = rand(100)
            accessoriesbool = true
            
            if avar < 10
                accessories_index = 3
                RARES[:accessories][:cigarette] += 1
            elsif avar < 40
                accessories_index = 2
                RARES[:accessories][:sunglasses] += 1
            else
                accessories_index = 1
                RARES[:accessories][:glasses] += 1
            end
        end
        
# Gender split: Female

    else
        mvar = rand(100)
        g_string = "Female"
        
        RARES[:gender][:female] += 1
        
        # Calculate variable to determine mouth type rarity.
        
        if mvar < 20
            mouth_index = 4
            RARES[:mouth][:tongue] += 1
        elsif mvar < 35
            mouth_index = 0
            RARES[:mouth][:smile] += 1
        elsif mvar < 40
            mouth_index = 1
            RARES[:mouth][:open] += 1
        else
            choice = rand(2)
        
            if choice == 0
                mouth_index = 2
                RARES[:mouth][:redlips] += 1
            else
                mouth_index = 3
                RARES[:mouth][:purplelips] += 1
            end
        end
        
        # Calculate variable to determine if wearing a hat, and if so, rarity.
        
        choicevar = rand(10)
        
        if choicevar < 4
            hvar = rand(100)
            hatbool = true
            
            if hvar < 5
                hat_index = 4
                RARES[:hat][:supreme] += 1
            elsif hvar < 25
                hat_index = 1
                RARES[:hat][:cowboy] += 1
            else
                if choice == 0
                    hat_index = 2
                    RARES[:hat][:redcap] += 1
                else
                    hat_index = 3
                    RARES[:hat][:bluecap] += 1
                end
            end
        end
        
        # Calculate variable to determine if star has accessory, and if so, rarity.
        
        choicevar2 = rand(10)
        avar = rand(100)
        
        if choicevar2 < 2
            accessoriesbool = true
            if avar < 10
                accessories_index = 3
                RARES[:accessories][:cigarette] += 1
            elsif avar < 25
                accessories_index = 4
                RARES[:accessories][:earrings] += 1
            elsif avar < 40
                accessories_index = 2
                RARES[:accessories][:sunglasses] += 1
            else
                accessories_index = 1
                RARES[:accessories][:glasses] += 1
            end
        end
    end
    
    # Above case statements capture gender differences in attribute types.
    # The following case statements apply to ALL stars equally.
    
    # Calculate variable to determine type of shoes the Star has.
    
    shoesvar = rand(100)
    
    if shoesvar < 5
        shoes_index = 1
        RARES[:shoes][:forces] += 1
    elsif shoesvar < 10
        shoes_index = 2
        RARES[:shoes][:vans] += 1
    elsif shoesvar < 15
        choice = rand(2)

        if choice == 0
            shoes_index = 3
            RARES[:shoes][:redconv] += 1
        else
            shoes_index = 4
            RARES[:shoes][:blueconv] += 1
        end
    else
        shoes_index = 0
        RARES[:shoes][:black] += 1
    end
    
    # Calculate variable to determine type of nose the Star has.
        
    nosevar = rand(100)
    
    if nosevar < 10
        nose_index = 3
        RARES[:nose][:four] += 1
    elsif nosevar < 20
        nose_index = 2
        RARES[:nose][:three] += 1
    elsif nosevar < 30
        nose_index = 1
        RARES[:nose][:two] += 1
    else
        nose_index = 0
        RARES[:nose][:one] += 1
    end
    
    # Calculate variable to determine type of eyes the Star has.
        
    eyesvar = rand(100)
    
    if eyesvar < 5
        eyes_index = 5
        RARES[:eyes][:six] += 1
    elsif eyesvar < 25
        eyes_index = 0
        RARES[:eyes][:one] += 1
    elsif eyesvar < 30
        eyes_index=3+rand(3)
        
        if eyes_index == 3
            RARES[:eyes][:three] += 1
        elsif eyes_index == 4
            RARES[:eyes][:four] += 1
        else
            RARES[:eyes][:five] += 1
        end
    else
        eyes_index = 1
        RARES[:eyes][:two] += 1
    end
    
    # Calculate variable to determine if the Star is wearing socks, and if so, rarity.

    crand = rand(10)

    if crand < 6
        socksvar = rand(100)
        socksbool = true
        
        if socksvar < 5
            socks_index = 3
            RARES[:socks][:rainbow] += 1
        elsif socksvar < 40
            socks_index = 2
            RARES[:socks][:black] += 1
        else
            socks_index = 1
            RARES[:socks][:white] += 1
        end
    end
    
    # Combine all indices of each attribute into current code array.
        
    codes = [bg_index+1, body_index+1, shoes_index+1, mouth_index+1, nose_index+1, eyes_index+1, socks_index, hat_index, accessories_index]
    
    if codeslist.include?(codes)
        # Star already made, continue generating.
    else
        star = generate_star( codes ) # Generate star
        counter += 1 # Increment Star index
        
        # Create image names
        
        name = "./gen/star-" + "#{counter}" + ".png"
        zoomname = "./img/star-" + "#{counter}" + "x6.png"
        
        # Dictionary to store token metadata in desc/
        
        tempHash = {
            "id" => counter - 1,
            "description" => "This star, Star #{counter}, is a unique Star and is sure to be a digital avatar that will make you feel like a Star for a lifetime.",
            "external_url" => "https://starsnft.herokuapp.com/",
            "image" => "https://raw.githubusercontent.com/samherring99/starsnft/main/images/star-#{counter}x6.png",
            "name" => "Star " + "#{counter}",
            "attributes" => [
            {
                "trait_type" => "Gender",
                "value" => g_string
            },
            {
                "trait_type" => "Background",
                "value" => PARTS[:bg][:attributes][bg_index][0]
            },
            {
                "trait_type" => "Body",
                "value" => PARTS[:body][:attributes][body_index][0]
            },
            {
                "trait_type" => "Mouth",
                "value" => PARTS[:mouth][:attributes][mouth_index][0]
            },
            {
                "trait_type" => "Nose",
                "value" => PARTS[:nose][:attributes][nose_index][0]
            },
            {
                "trait_type" => "Eyes",
                "value" => PARTS[:eyes][:attributes][eyes_index][0]
            },
            {
                "trait_type" => "Shoes",
                "value" => PARTS[:shoes][:attributes][shoes_index][0]
            }]
        }
        
        # If star is wearing socks, add it to metadata dictionary.
            
        if socksbool
            tempHash["attributes"].append({"trait_type" => "Socks", "value" => PARTS[:socks][:attributes][socks_index-1][0]})
        end
        
        # If star is wearing a hat, add it to metadata dictionary.
        
        if hatbool
            tempHash["attributes"].append({"trait_type" => "Hat", "value" => PARTS[:hat][:attributes][hat_index-1][0]})
        end
        
        # If star has an accessory, add it to metadata dictionary.
            
        if accessoriesbool
            tempHash["attributes"].append({"trait_type" => "Accessories", "value" => PARTS[:accessories][:attributes][accessories_index-1][0]})
        end
        
        # Open this Star's description JSON file, format the dictionary inside.
        
        File.open("./desc/#{counter-1}.json","w") do |f|
          f.write(JSON.pretty_generate(tempHash))
        end
        
        File.rename("./desc/#{counter-1}.json", "./desc/#{counter-1}")
        
        # Print star data to console for debug.
        
        puts "Generated Star: " + "#{counter}" + " with attributes: " + g_string + ", " + PARTS[:bg][:attributes][bg_index][0] + ", " + PARTS[:body][:attributes][body_index][0] + ", " + PARTS[:mouth][:attributes][mouth_index][0] + ", " + PARTS[:nose][:attributes][nose_index][0] + ", " + PARTS[:eyes][:attributes][eyes_index][0] + ", " + PARTS[:socks][:attributes][socks_index-1][0] + ", " + PARTS[:hat][:attributes][hat_index-1][0] + ", " + PARTS[:accessories][:attributes][accessories_index-1][0]
        
        # Save the generated star, its image at 6x, and add its code to the dictionary.
        
        star.save( name )
        star.zoom( 6 ).save( zoomname )
        codeslist.append(codes)
        
        # Reset optional booleans, restart loop.
        
        hatbool = false
        socksbool = false
        accessoriesbool = false
    end
    
end

# This dictionary is used to generate the metadata.json file, change parameters as needed.

totaljson = {"name" => "Stars",
    "description" => "There are #{counter} total Stars on the blockchain.",
    "image" => "https://raw.githubusercontent.com/samherring99/starsnft/main/coverstar.png",
    "external_link" => "https://google.com",
    "seller_fee_basis_points" => 250,
    "fee_recipient" => "0x66449A3015488DA72976DCff99C6A75Bf94aAfda"}

# Write metadata file.

File.open("./metadata.json","w") do |f|
  f.write(JSON.pretty_generate(totaljson))
end

# Display rarities/counts of attributes for debug purposes.

puts "\nRarities by Attribute: \n"

puts "Gender: #{RARES[:gender][:male]} Male #{RARES[:gender][:female]} Female."
puts "BG: #{RARES[:bg][:red]} Red #{RARES[:bg][:orange]} Orange #{RARES[:bg][:yellow]} Yellow #{RARES[:bg][:green]} Green #{RARES[:bg][:blue]} Blue #{RARES[:bg][:purple]} Purple"
puts "Shoes: #{RARES[:shoes][:black]} Black Shoes #{RARES[:shoes][:vans]} Vans #{RARES[:shoes][:redconv]} Red Converse #{RARES[:shoes][:blueconv]} Blue Converse #{RARES[:shoes][:forces]} AF1s  "
puts "Socks: #{RARES[:socks][:white]} White #{RARES[:socks][:black]} Black  #{RARES[:socks][:rainbow]} Rainbow"
puts "Hat: #{RARES[:hat][:cowboy]} Cowboy #{RARES[:hat][:redcap]} Red Baseball Cap  #{RARES[:hat][:bluecap]} Blue Baseball Cap #{RARES[:hat][:supreme]} Supreme Cap #{RARES[:hat][:wizard]} Wizard Hat #{RARES[:hat][:fez]} Fez"
puts "Accessories: #{RARES[:accessories][:glasses]} Glasses #{RARES[:accessories][:sunglasses]} Sunglasses #{RARES[:accessories][:cigarette]} Cigarette #{RARES[:accessories][:earrings]} Earrings "

puts "\n--------------------------- Generated #{counter} Images! ---------------------------\n"
