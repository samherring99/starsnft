require 'pixelart'     ## helper library for pixel art images (in .png)
require 'json'

## WHEN GENERATING -- add gender, percentage RARES, use this code! M/F 70/30

total_num = 5000

codeslist = []

hatbool = false
socksbool = false
accessoriesbool = false

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
  bg:  { required: true,
           attributes: [['Blue', 'u'],
                        ['Green', 'u'],
                        ['Orange', 'u'],
                        ['Purple', 'u'],
                        ['Red', 'u'],
                        ['Yellow', 'u']] }, # ROY - 20%, BP - 15%, G - 10%
  body:  { required: true,
           attributes: [['Body 1', 'u'],
                        ['Body 2', 'u'],
                        ['Body 3', 'u'],
                        ['Body 4', 'u'],
                        ['Body 5', 'u']] }, # All 20%
  shoes:  { required: true,
      attributes: [['Black', 'u'],
                   ['AF1s', 'u'],
                   ['Checkered Vans', 'u'],
                   ['Red Converse', 'u'],
                   ['Blue Converse', 'u']] }, # Black - 50%, Converse - 15%, Vans - 10%, AF1s - 5%
  mouth: { required: true,
           attributes: [['Black Smile',  'u'],
                        ['Black Open',    'u'],
                        ['Red Smile',           'f'],
                        ['Purple Smile',                'f'],
                        ['Tongue Out',     'u'],
                        ['Zombie Mouth', 'm']] }, # Black Open - 40%, Black Smile - 35%, Lipstick - 20%, Tongue - 20%, Zombie Mouth - 5%
  nose:  { required: true,
           attributes: [['Nose 1',          'u'],
                        ['Nose 2', 'u'],
                        ['Nose 3',  'u'],
                        ['Nose 4', 'u']] }, # Nose 1 - 40%, Nose 2 - 30%,, Nose 3 - 20%, Nose 4 - 10%
  eyes:  { required: true,
           attributes: [['Eyes 1', 'u'],
                        ['Eyes 2', 'u'],
                        ['Eyes 3', 'u'],
                        ['Eyes 4', 'u'],
                        ['Eyes 5', 'u'],
                        ['Eyes 6', 'u']] }, # Eyes 1 - 25%, Eyes 2 - 40%, Eyes3/4/5 - 30% Eyes 6 - 5%,
  socks:  { required: false, # 60% Chance
           attributes: [['Black Socks', 'u'],
                        ['White Socks', 'u'],
                        ['Rainbow Socks', 'u']] },  # White - 55%, Black - 40%, Rainbow - 5%
  hat:  { required: false, # 40 % Chance
           attributes: [['Cowboy Hat', 'u'],
                        ['Red Cap', 'u'],
                        ['Blue Cap', 'u'],
                        ['Camp Cap', 'u'],
                        ['Wizard Hat', 'm'],
                        ['Fez', 'm']] }, # Cap - 45%, Cowboy - 25%, Wizard - 15%, Fez - 10%, Supreme Cap -  5%
  accessories:  { required: false, # 20% Chance
           attributes: [['Glasses',        'u'],
                        ['Sunglasses',      'u'],
                        ['Cigarette',         'u'],
                        ['Earrings',     'f']] } # Glasses - 50%, Sunglasses - 40%, Earrings - 25%, Cigarette - 10%
}

def generate_punk( codes )
  punk = Pixelart::Image.new( 56, 56 )

  PARTS.each_with_index do |(key,part),i|
    code  = codes[i]
    if code != 0    ## if code 0 - skip optional part

      ## for debugging print attributes with names (size not 0, that is, "")
      ##attribute = part[:attributes][code-1]
      ##puts "#{key}#{code} - #{attribute[0]} (#{attribute[1]})"  if attribute[0].size > 0

      ## compose parts on top (from face to accessoire)
      #puts "#{code}"
      tester = "./parts/#{key}/#{key}" + "#{code}" + ".png"
      #puts tester
      path = "./parts/#{key}/#{key}#{code}.png"
      part = Pixelart::Image.read( tester )
      punk.compose!( part )
    end
  end

  punk
end

##codes = [2, 3, 1, 1, 1, 1, 1, 1, 3]
##punk = generate_punk( codes )
##name = "./gen/punk-" + "#{codes[0]}" + "#{codes[1]}" + ".png"
##punk.save( name )

totalrange = (1..500)
counter=0
codes=[0, 0, 0, 0, 0, 0, 0, 0, 0]

totaljson = {"tokens" => [], "metadata" => {"name" => "Starboys",
    "description" => "Starboys are unique characters and are fun and cool and interesting.",
    "image" => "https://gateway.pinata.cloud/ipfs/QmXWDbSAvbGRuwUEEpegRRbFGegoxdSeKBJVV5TbGX6W6y/star-11x6.png",
    "external_link" => "https://google.com",
    "seller_fee_basis_points" => 250,
    "fee_recipient" => "0x66449A3015488DA72976DCff99C6A75Bf94aAfda"}}

totalrange.each_with_index do |index|
    #puts rand(index)
    g_string = "Male"
    bg_index = 0
    body_index = rand(5)
    shoes_index = 0
    mouth_index = 0
    nose_index = 0
    eyes_index = 0
    socks_index = 0
    hat_index = 0
    accessories_index = 0
    
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
    
    gender = rand(10)
    bgvar = rand(100)
    
    
    if bgvar < 10
        # GREEN
        bg_index = 3
        RARES[:bg][:green] += 1
    elsif bgvar < 15
        # Blue/Purple - random choice
        choice = rand(2)
        
        if choice == 0
            bg_index = 4
            RARES[:bg][:blue] += 1
        else
            bg_index = 5
            RARES[:bg][:purple] += 1
        end
    else
        # ROY random choice
        bg_index = rand(3)
        
        if bg_index == 0
            RARES[:bg][:red] += 1
        elsif bg_index == 1
            RARES[:bg][:orange] += 1
        else
            RARES[:bg][:yellow] += 1
        end
    
    end
    
    if gender < 7 # Male
        
        RARES[:gender][:male] += 1

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
    else
        mvar = rand(100)
        g_string = "Female"
        
        RARES[:gender][:female] += 1
        
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
        
    eyesvar = rand(100)
    
    if eyesvar < 5
        # 6
        eyes_index = 5
        RARES[:eyes][:six] += 1
    elsif eyesvar < 25
        # 1
        eyes_index = 0
        RARES[:eyes][:one] += 1
    elsif eyesvar < 30
        # 3/4/5
        eyes_index=3+rand(3)
        
        if eyes_index == 3
            RARES[:eyes][:three] += 1
        elsif eyes_index == 4
            RARES[:eyes][:four] += 1
        else
            RARES[:eyes][:five] += 1
        end
    else
        # 2
        eyes_index = 1
        RARES[:eyes][:two] += 1
    end

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
        
        
    codes = [bg_index+1, body_index+1, shoes_index+1, mouth_index+1, nose_index+1, eyes_index+1, socks_index, hat_index, accessories_index]
    
    if codeslist.include?(codes)
        # Punk already made, continue
    else
        punk = generate_punk( codes )
        counter += 1
        name = "./gen/star-" + "#{counter}" + ".png"
        zoomname = "./img/star-" + "#{counter}" + "x6.png"
        
        tempHash = {
            "id" => counter - 1,
            "description" => "This star, Star #{counter}, is a unique Star in the set of 500 and is sure to be a digital avatar that will make you feel like a Star for a lifetime.",
            "external_url" => "https://starsnft.herokuapp.com/",
            "image" => "https://raw.githubusercontent.com/samherring99/starsnft/master/images/star-#{counter}x6.png",
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
            
        if socksbool
            tempHash["attributes"].append({"trait_type" => "Socks", "value" => PARTS[:socks][:attributes][socks_index-1][0]})
        end
        
        if hatbool
            tempHash["attributes"].append({"trait_type" => "Hat", "value" => PARTS[:hat][:attributes][hat_index-1][0]})
        end
            
        if accessoriesbool
            tempHash["attributes"].append({"trait_type" => "Accessories", "value" => PARTS[:accessories][:attributes][accessories_index-1][0]})
        end
        
        File.open("./desc/#{counter-1}.json","w") do |f|
          f.write(JSON.pretty_generate(tempHash))
        end
        
        ##totaljson["tokens"].append(tempHash)
        
        puts "Star: " + "#{counter}" + " " + g_string + " " + PARTS[:bg][:attributes][bg_index][0] + " " + PARTS[:body][:attributes][body_index][0] + " " + PARTS[:mouth][:attributes][mouth_index][0] + " " + PARTS[:nose][:attributes][nose_index][0] + " " + PARTS[:eyes][:attributes][eyes_index][0] + " " + PARTS[:socks][:attributes][socks_index-1][0] + " " + PARTS[:hat][:attributes][hat_index-1][0] + " " + PARTS[:accessories][:attributes][accessories_index-1][0]
        punk.save( name )
        punk.zoom( 6 ).save( zoomname )
        codeslist.append(codes)
        
        hatbool = false
        socksbool = false
        accessoriesbool = false
    end
    
end

File.open("./desc/test_set.json","w") do |f|
  f.write(JSON.pretty_generate(totaljson))
end

puts RARES

puts "Gender: #{RARES[:gender][:male]} Male #{RARES[:gender][:female]} Female."
puts "BG: #{RARES[:bg][:red]} Red #{RARES[:bg][:orange]} Orange #{RARES[:bg][:yellow]} Yellow #{RARES[:bg][:green]} Green #{RARES[:bg][:blue]} Blue #{RARES[:bg][:purple]} Purple"
puts "Shoes: #{RARES[:shoes][:black]} Black Shoes #{RARES[:shoes][:vans]} Vans #{RARES[:shoes][:redconv]} Red Converse #{RARES[:shoes][:blueconv]} Blue Converse #{RARES[:shoes][:forces]} AF1s  "
puts "Socks: #{RARES[:socks][:white]} White #{RARES[:socks][:black]} Black  #{RARES[:socks][:rainbow]} Rainbow"
puts "Hat: #{RARES[:hat][:cowboy]} Cowboy #{RARES[:hat][:redcap]} Red Baseball Cap  #{RARES[:hat][:bluecap]} Blue Baseball Cap #{RARES[:hat][:supreme]} Supreme Cap #{RARES[:hat][:wizard]} Wizard Hat #{RARES[:hat][:fez]} Fez"
puts "Accessories: #{RARES[:accessories][:glasses]} Glasses #{RARES[:accessories][:sunglasses]} Sunglasses #{RARES[:accessories][:cigarette]} Cigarette #{RARES[:accessories][:earrings]} Earrings "



=begin
bgrange = (1..5)
bodyrange = (1..4)
shoesrange = (1..4)
mouthrange = (1..5)
noserange = (1..3)
eyesrange = (1..5)
socksrange = (0..2)
hatrange = (0..5)
accessoriesrange = (0..3)

bgrange.each_with_index do |bgkey,i|
    bodyrange.each_with_index do |bkey,i|
        shoesrange.each_with_index do |skey,i|
            mouthrange.each_with_index do |mkey,i|
                noserange.each_with_index do |nkey,i|
                    eyesrange.each_with_index do |ekey,i|
                        socksrange.each_with_index do |sokey,i|
                            hatrange.each_with_index do |hkey,i|
                                accessoriesrange.each_with_index do |akey,i|
                                    codes = [bgkey, bkey, skey, mkey, nkey, ekey, sokey, hkey, akey]
                                    punk = generate_punk( codes )
                                    name = "./gen/star-" + "#{codes[0]}" + "#{codes[1]}" + "#{codes[2]}" + "#{codes[3]}" + "#{codes[4]}" +"#{codes[5]}" + "#{codes[6]}" + "#{codes[7]}" + "#{codes[8]}" + ".png"
                                    puts "Generating " + name
                                    punk.save( name )
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
=end

