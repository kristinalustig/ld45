function love.load()
  --BASIC INITIALIZATION STUFF
  love.window.setMode(640, 640)
  love.window.setTitle("aphantasia")
  paintFont = love.graphics.newFont("/assets/Arvo-Regular.ttf", 14)
  titleFont = love.graphics.newFont("/assets/Arvo-Regular.ttf", 24)
  phoneFont = love.graphics.newFont("/assets/Arvo-Regular.ttf", 20)
  hugeFont = love.graphics.newFont("/assets/Arvo-Regular.ttf", 40)
  love.graphics.setBackgroundColor(.55, .55, .55, 1)
  cursor = love.mouse.newCursor("/assets/paintCursor.png",0,55)

  --canvas for saving drawing???

  --INITIALIZE ASSETS

  --MAIN MENU
  themeSong = love.audio.newSource("/assets/Theme.wav", "static")
  themeSong:setLooping(true)
  titleWords = love.graphics.newImage("/assets/titleWords.png")
  titleCard1 = love.graphics.newImage("/assets/titleCard1.png")
  titleCard2 = love.graphics.newImage("/assets/titleCard2.png")
  subtitle = "[n]. The inability to form mental images of objects that are not present."
  continue = "click anywhere to continue..."

  instructions = "You're working with a local psychiatrist on a new therapy to lessen the negative effects that aphantasia has on those who suffer from it."

  instructionsA = "Because they cannot form their own mental images, you've volunteered to help them create physical representations of their purely verbal thoughts."

  instructions1 = "In other words, you're painting their memories."

  livingRoom = love.graphics.newImage("/assets/background.png")
  canvasBackground = love.graphics.newImage("/assets/canvasBackground.png")
  easel = love.graphics.newImage("/assets/easel.png")
  palette = love.graphics.newImage("/assets/palette.png")
  eraser = love.graphics.newImage("/assets/erase.png")
  eraserInHand = love.graphics.newImage("/assets/eraserInHand.png")
  phoneStand = love.graphics.newImage("/assets/phoneStand.png")
  phoneDown = love.graphics.newImage("/assets/phoneDown.png")
  phoneUp = love.graphics.newImage("/assets/phoneUp.png")

  --sound effects
  phoneRing = love.audio.newSource("/assets/phoneRing.wav","static")
  tubeSwitch = love.audio.newSource("/assets/Switch.wav","static")
  paintPlace = love.audio.newSource("/assets/Place.wav","static")

  palettePaint = {}
  pTable = nil
  paletteScale = {}
  palettePlacementX = {}
  palettePlacementY = {}

  --TUBE ONE ASSETS
  tubeOne = love.graphics.newImage("/assets/tubeOne.png")
  oneLabel = love.graphics.newText(paintFont, "Place")
  blobOne = love.graphics.newImage("/assets/blobOne.png")

  palettePaint[1] = love.graphics.newImage("/assets/office.png")
  paletteScale[1] = .25
  palettePlacementX[1] = 214
  palettePlacementY[1] = 80

  palettePaint[2] = love.graphics.newImage("/assets/library.png")
  paletteScale[2] = .25
  palettePlacementX[2] = 214
  palettePlacementY[2] = 80

  palettePaint[3] = love.graphics.newImage("/assets/kitchen.png")
  paletteScale[3] = .25
  palettePlacementX[3] = 214
  palettePlacementY[3] = 80

  palettePaint[4] = love.graphics.newImage("/assets/outside.png")
  paletteScale[4] = .25
  palettePlacementX[4] = 205
  palettePlacementY[4] = 100


  --TUBE TWO ASSETS
  tubeTwo = love.graphics.newImage("/assets/tubeTwo.png")
  twoLabel = love.graphics.newText(paintFont, "Furniture")
  blobTwo = love.graphics.newImage("/assets/blobTwo.png")

  palettePaint[5] = love.graphics.newImage("/assets/books.png")
  paletteScale[5] = .3
  palettePlacementX[5] = 185
  palettePlacementY[5] = 130

  palettePaint[6] = love.graphics.newImage("/assets/sink.png")
  paletteScale[6] = .5
  palettePlacementX[6] = 195
  palettePlacementY[6] = 100

  palettePaint[7] = love.graphics.newImage("/assets/table.png")
  paletteScale[7] = .6
  palettePlacementX[7] = 208
  palettePlacementY[7] = 90


  --TUBE THREE ASSETS
  tubeThree = love.graphics.newImage("/assets/tubeThree.png")
  threeLabel = love.graphics.newText(paintFont, "Stuff")
  blobThree = love.graphics.newImage("/assets/blobThree.png")

  palettePaint[8] = love.graphics.newImage("/assets/clock.png")
  paletteScale[8] = 1
  palettePlacementX[8] = 230
  palettePlacementY[8] = 100

  palettePaint[9] = love.graphics.newImage("/assets/fire.png")
  paletteScale[9] = .7
  palettePlacementX[9] = 220
  palettePlacementY[9] = 94

  palettePaint[10] = love.graphics.newImage("/assets/trees.png")
  paletteScale[10] = .25
  palettePlacementX[10] = 205
  palettePlacementY[10] = 100


  --TUBE FOUR ASSETS
  tubeFour = love.graphics.newImage("/assets/tubeFour.png")
  fourLabel = love.graphics.newText(paintFont, "Time")
  blobFour = love.graphics.newImage("/assets/blobFour.png")

  palettePaint[11] = love.graphics.newImage("/assets/day.png")
  paletteScale[11] = .22
  palettePlacementX[11] = 214
  palettePlacementY[11] = 90

  palettePaint[12] = love.graphics.newImage("/assets/sunset.png")
  paletteScale[12] = .22
  palettePlacementX[12] = 214
  palettePlacementY[12] = 98

  palettePaint[13] = love.graphics.newImage("/assets/night.png")
  paletteScale[13] = .22
  palettePlacementX[13] = 214
  palettePlacementY[13] = 90


  story = {}
  storyNum = 1
  gameNum = 1
  story[1] = {}
  story[2] = {}
  story[3] = {}
  story[4] = {}

  envelope = love.graphics.newImage("/assets/envelope.png")
  paper = love.graphics.newImage("/assets/paper.png")

  --INTRO INFO + NARRATIVE FOR GAME 1
  songOne = love.audio.newSource("/assets/Song1.wav","static")
  songOne:setLooping(true)
  letterOne = love.graphics.newImage("/assets/letterOne.png")
  addressOne = love.graphics.newImage("/assets/addressOne.png")


  story[1][1] = "Oh, hello old friend. Do you have time to talk with me about my memory?"
  story[1][2] = "Great! I'm going to start describing the scene. I think you can cycle through paint types by clicking on the tubes."
  story[1][3] = "Then, you can drag paint from the palette to the canvas. If you make a mistake, you can just erase it and catch up, right?"
  story[1][4] = "I can't wait to see my painting!"
  story[1][5] = "Okay, so I guess I'll jump right in. One day, the day after my husband died, I ... I don't remember much, but I do remember my intense grief."
  story[1][6] = "And I remember one day, right in the middle of the day... I was sitting there in my kitchen."
  story[1][7] = "Rats! Did I say middle of the day? I meant nighttime. I remember because I could see the clock by the full moon's light."
  story[1][8] = "Anyway, I sat there at the table, staring at the clock, and realized that as time passed, being without Henry wouldn't get easier."
  story[1][9] = "But I also realized that I'd get through it. Just as sure as the clock moves from one hour to next."
  story[1][10] = "And won't that painting be a powerful reminder? Ah, well. Thanks for indulging a wistful old woman."

  --INTRO INFO + NARRATIVE FOR GAME 2
  songTwo = love.audio.newSource("/assets/Song2.wav","static")
  songTwo:setLooping(true)
  letterTwo = love.graphics.newImage("/assets/letterTwo.png")
  addressTwo = love.graphics.newImage("/assets/addressTwo.png")

  story[2][1] = "Oh wow, I still can't believe I might get some help with this!"
  story[2][2] = "I mean I'm still only ten and a half and everything but I really hate not being able to have an imagination."
  story[2][3] = "[muffled] Ugh, honey, of COURSE you do, it's just different!"
  story[2][4] = "ANYWAY. I want to be able to remember when I was a KID again. Because I used to LOVE going to the library!"
  story[2][5] = "I used to try so hard to get the pictures into my head from the books. I watched the minutes go by on the big clock."
  story[2][6] = "I still really love going there, maybe some bright sunny day soon my mom will bring me again."
  story[2][7] = "*shout* MOM, CAN WE GO TO THE LIBRARY?"

  --INTRO INFO + NARRATIVE FOR GAME 3
  letterThree = love.graphics.newImage("/assets/letterThree.png")
  addressThree = love.graphics.newImage("/assets/addressThree.png")

  story[3][1] = "Heya. Glad you answered. Feel a bit weird callin' about this."
  story[3][2] = "I wanted to tell you about this place I used to camp out at."
  story[3][3] = "Used to wake up and start a fire amongst all those trees..."
  story[3][4] = "Wait. Doesn't sound right... must've been sunset."
  story[3][5] = "Thanks a bunch, man."

  --INTRO INFO FOR GAME 4
  --letterFour = love.graphics.newImage("/assets/letterFour.png")
  --addressFour = love.graphics.newImage("/assets/addressFour.png")

  readyToShare = "Click here when you're done with this painting."
  uncalc = true


  canvas = love.graphics.newCanvas(480, 302)

  --TYPEWRITER SETUP
  letterTimer = .03
  currentLetter = 0
  timePassed = 0
  waitTime = 0

  --GAME STORAGE
  gameState = 1 --for going thru different parts of game / shortcuts
  next = 0 --for going thru opening info
  evalStart = false --finishing up
  eval = false --ready to share!


  --office, lib, kitchen, outside, book, sink, table, clock, fire, trees, day, sunset, night
  points = 0
  winCon = {}
  solution = {}
  solution[1] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
  solution[2] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
  solution[3] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
  winCon[1] = {0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1}
  winCon[2] = {0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0}
  winCon[3] = {0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0}

  maxPoints = {5, 4, 4}
  congrats = "(This is a perfect score!)"
  winner = love.audio.newSource("/assets/Winner.wav", "static")
  winner:setLooping(false)
  youWin = false

  realSolution = {}
  realSolution[1] = love.graphics.newImage("/assets/realSolution1.png")
  realSolution[2] = love.graphics.newImage("/assets/realSolution2.png")
  realSolution[3] = love.graphics.newImage("/assets/realSolution3.png")



  --VARIABLES: CONTROLLING CLICK STATE.
  clickFocus = nil

  endingWords = "Thanks so much for playing aphantasia! You beat the game! If you want to play it again, please ...close and restart it, because I didn't have time to implement that.Thanks to love2d for the code tools, medly and bfxr for the sound tools, procreate for the art tools, and coffee for the brain tools. Send your wackiest art creations to me on twitter @kristinalustig."


end


-- ++++++++++++ MAIN UPDATE FUNCTION FOR CALCULATIONS ++++++++++++++++++
function love.update(dt)

  if gameState == 1 then
    timePassed = timePassed + dt
    if timePassed > 2 then
      next = 1
    end
    if timePassed > 4 then
      next = 2
    end
  end



  if gameState == 2 then
    timePassed = timePassed + dt
    if timePassed > 2 then
      next = 1
    end
    if timePassed > 4 then
      next = 2
    end

  end

  if gameState == 3 then
    timePassed = timePassed + dt
    if timePassed > 2 then
      next = 1
    end
    if timePassed > 4 then
      next = 2
    end

  end



  if gameState == 4 then

    --TYPEWRITER
    --if gameEnd == false then
      timePassed = timePassed + dt
      if timePassed >= letterTimer then
        timePassed = 0
        currentLetter = currentLetter + 1
      end

      if currentLetter > string.len(story[gameNum][storyNum]) then
        waitTime = waitTime + dt
        if waitTime > 3 then
          if story[gameNum][storyNum+1] == nil then
            love.audio.stop()
            gameEnd = true
          else
            currentLetter = 0
            storyNum = storyNum + 1
            waitTime = 0
          end
        end
      end
    --end

    if gameEnd == true and evalStart == false and eval == false then
      evalStart = true
      timePassed = 0
    end

    if eval == true then
      evalStart = false
      if uncalc == true then
        for i = 1, 13 do
          if winCon[gameNum][i] == solution[gameNum][i] and winCon[gameNum][i] == 1 then
            points = points + 1
          end
        end
        uncalc = false
        pointsDetail = "You received points for this painting based on the number of correct elements you placed. When you're ready, please click anywhere to continue."
        if points == maxPoints[gameNum] then
          youWin = true
        end
      end

    end


  end

end


--+++++++++++++++ MAIN DRAWING FUNCTION ++++++++++++++++++
function love.draw()

  love.graphics.setBackgroundColor(.55, .55, .55, 1)

  --GAME STATE ONE
  if gameState == 1 then
    love.audio.play(themeSong)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setBackgroundColor(1, 1, 1, 1)
    love.graphics.draw(titleCard1)
    love.graphics.draw(titleCard2)
    love.graphics.setColor(0, 0, 0)
    love.graphics.draw(titleWords, 20, 100)

    if next >= 1 then
      love.graphics.printf(subtitle, titleFont, 20, 300, 600, "center")
    end

    if next >= 2 then

      love.graphics.printf(continue, titleFont, 0, 400, 640, "center")
    end
  end

  --GAME STATE TWO
  if gameState == 2 then
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(titleCard1)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(instructions, titleFont, 40, 100, 560, "center")
    love.graphics.printf(instructionsA, titleFont, 40, 200, 560, "center")

    if next >= 1 then
      love.graphics.printf(instructions1, titleFont, 40, 350, 560, "center")
    end

    if next >= 2 then
      love.graphics.printf(continue, titleFont, 0, 450, 640, "center")
    end
  end


  --GAME STATE THREE
  if gameState == 3 then
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(livingRoom)
    love.graphics.draw(phoneStand, 490, 80)
    love.graphics.draw(phoneDown, 524, 10)

    if next >= 1 then
      love.graphics.draw(envelope, 10, 200)
      if gameNum == 1 then
        love.graphics.draw(addressOne, 20, 216)
        elseif gameNum == 2 then
          love.graphics.draw(addressTwo, 20, 216)
        elseif gameNum == 3 then
          love.graphics.draw(addressThree, 20, 216)
        else
        --  love.graphics.draw(addressFour)
      end
    end

    if next >= 2 then
      love.graphics.draw(paper, 40, 100)
      if gameNum == 1 then
        love.graphics.draw(letterOne, 105, 140)
        elseif gameNum == 2 then
          love.graphics.draw(letterTwo, 105, 140)
        elseif gameNum == 3 then
          love.graphics.draw(letterThree, 105, 200)
        else
        --  love.graphics.draw(letterFour)
      end
      love.audio.play(phoneRing)
    end
  end

  --GAME STATE FOUR
  if gameState == 4 then

    love.mouse.setCursor(cursor)
    love.graphics.setColor(1, 1, 1)

    --background
    love.graphics.draw(livingRoom)
    love.graphics.draw(phoneStand, 490, 80)
    love.graphics.draw(phoneUp, 570, 96)

    --easel
    love.graphics.draw(easel, 150, 145, 0, 1.1)
    love.graphics.draw(canvasBackground, 150, 235)

    --palette
    love.graphics.draw(palette, 150, 30)

    --eraser
    love.graphics.draw(eraser, 0, 350)

    --image tubes
    love.graphics.draw(tubeOne, 0, 20)
    love.graphics.draw(oneLabel, 5, 40)

    love.graphics.draw(tubeTwo, 0, 90)
    love.graphics.draw(twoLabel, 5, 110)

    love.graphics.draw(tubeThree, 0, 160)
    love.graphics.draw(threeLabel, 5, 180)

    love.graphics.draw(tubeFour, 0, 230)
    love.graphics.draw(fourLabel, 5, 250)

    --text area
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 5, 555, 630, 80, 3, 3)
    love.graphics.setColor(1, 1, 1)

    --TYPEWRITER
    chars = story[gameNum][storyNum]:sub(1,currentLetter)
    love.graphics.printf(chars, phoneFont, 15, 560, 615, "left")

    love.graphics.setBlendMode("alpha", "premultiplied")
    love.graphics.draw(canvas, 151, 236)
    love.graphics.setBlendMode("alpha","alphamultiply")

    --TUBES TO PALETTE
    if pTable ~= nil and pTable > 0 then
      if pTable <=4 then
        love.graphics.draw(blobOne, 170, 60, 0, 1.2)
      end

      if pTable >4 and pTable <= 7 then
        love.graphics.draw(blobTwo, 170, 60, 0, 1.2)
      end

      if pTable >7 and pTable <= 10 then
        love.graphics.draw(blobThree, 170, 60, 0, 1.1)
      end

      if pTable >10 then
        love.graphics.draw(blobFour, 170, 60, 0, 1.1)
      end

      love.graphics.draw(palettePaint[pTable], palettePlacementX[pTable], palettePlacementY[pTable], 0, paletteScale[pTable])
    end

    if clickFocus ~= nil and clickFocus == "p" and pTable ~= nil then
      love.graphics.draw(palettePaint[pTable], love.mouse.getX()-20, love.mouse.getY()-20)
    end

    if clickFocus ~= nil and clickFocus == "e" then
      love.mouse.setVisible(false)
      love.graphics.draw(eraserInHand, love.mouse.getX()-60, love.mouse.getY())
    end

    if evalStart == true then
      love.graphics.setColor(.64, .71, 1, 1)
      love.graphics.rectangle("fill", 5, 555, 630, 80, 3, 3)
      love.graphics.setColor(0, 0, 0)
      love.graphics.printf(readyToShare, phoneFont, 0, 575, 640, "center")
      love.graphics.setColor(1, 1, 1)
    end

    if eval == true then
      love.graphics.setColor(.64, .71, 1, 1)
      love.graphics.rectangle("fill", 0, 0, 640, 640)
      love.graphics.setColor(0, 0, 0)
      love.graphics.printf(points, hugeFont, 0, 60, 640, "center")
      if youWin == true then
        love.graphics.printf(congrats, titleFont, 0, 105, 640, "center")
      end
      love.graphics.printf(pointsDetail, phoneFont, 20, 140, 600, "center")
      love.graphics.setColor(1, 1, 1)
      love.graphics.draw(canvasBackground, 0, 210)
      love.graphics.setBlendMode("alpha", "premultiplied")
      love.graphics.draw(canvas, 0, 210)
      love.graphics.setBlendMode("alpha","alphamultiply")
      love.graphics.draw(realSolution[gameNum], 360, 420, 0, .5)
    end

  end

  if gameState == 5 then

    love.audio.play(themeSong)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setBackgroundColor(1, 1, 1, 1)
    love.graphics.draw(titleCard1)
    love.graphics.draw(titleCard2)
    love.graphics.setColor(0, 0, 0)
    love.graphics.draw(titleWords, 20, 100)
    love.graphics.printf(endingWords, titleFont, 40, 340, 560, "center")
  end
end

--main pressed listener - routing clicks to the right place
function love.mousepressed(x, y, button, isTouch)
  if gameState == 1 and button == 1 and next == 2 then
    gameState = gameState + 1
    timePassed = 0
    next = 0
  end

  if gameState == 2 and button == 1 and next == 2 then
    gameState = gameState + 1
    timePassed = 0
    next = 0
    love.audio.stop()
  end

  if gameState == 3 and button == 1 and next == 2 then
    gameState = gameState + 1
    timePassed = 0
    next = 0
    if gameNum == 1 then
      love.audio.play(songOne)
      elseif gameNum == 2 then
        love.audio.play(songTwo)
      elseif gameNum == 3 then
        love.audio.play(themeSong)
      else
    end
  end

  if gameState == 4 then
    if button == 1 and love.mouse.getX() <= 132 then

      --tube one click?
      if love.mouse.getY() <= 72 and love.mouse.getY() >= 20 then
        tubeClicked(tubeOne)
      end

      --tube two click?
      if love.mouse.getY() <= 142 and love.mouse.getY() >= 90 then
        tubeClicked(tubeTwo)
      end

      --tube three click?
      if love.mouse.getY() <= 212 and love.mouse.getY() >= 160 then
        tubeClicked(tubeThree)
      end

      --tube four click?
      if love.mouse.getY() <= 282 and love.mouse.getY() >= 230 then
        tubeClicked(tubeFour)
      end

      if love.mouse.getY() <=470 and love.mouse.getY() >= 350 and love.mouse.getX() <= 110 then
        clickFocus = "e"
      end

    end

    if button == 1 and paletteCheck(love.mouse.getX(), love.mouse.getY()) == true then
      clickFocus = "p"
    end

    if evalStart == true and button == 1 and love.mouse.getY() > 555 then
        eval = true
    end

    if eval == true and button == 1 and next == 1 then
      love.graphics.clear(.55, .55, .55, 1)
      gameState = 3
      gameEnd = false
      timePassed = 0
      next = 0
      evalStart = false
      uncalc = true
      eval = false
      youWin = false
      love.graphics.setCanvas(canvas)
        love.graphics.clear()
      love.graphics.setCanvas()
      love.mouse.setCursor()
      currentLetter = 0
      points = 0
      waitTime = 0
      clickFocus = nil
      storyNum = 1
      if gameNum == 3 then
        gameState = 5
        love.audio.play(winner)
      end
      gameNum = gameNum + 1
    elseif eval == true and button == 1 and next == 0 then
      next = 1
      evalStart = false
    end
  end

end

function love.mousereleased(x, y, button, isTouch)
  if gameState == 4 then
    if canvasCheck(love.mouse.getX(), love.mouse.getY()) == true and clickFocus == "p" then
      love.audio.play(paintPlace)
      solution[gameNum][pTable] = 1
      love.graphics.setCanvas(canvas)
        love.graphics.draw(palettePaint[pTable], love.mouse.getX()-170, love.mouse.getY()-255)
      love.graphics.setCanvas()
    end

    if canvasCheck(love.mouse.getX(), love.mouse.getY()) == true and clickFocus == "e" then
      for i = 1, 13 do
        solution[gameNum][i] = 0
      end
      love.graphics.setCanvas(canvas)
        love.graphics.clear()
      love.graphics.setCanvas()
    end
    clickFocus = nil
    love.mouse.setVisible(true)
  end
end

--tube actions
function tubeClicked(tube)
  if pTable == nil then
    pTable = 0
  end

  --TUBE ONE
  if tube == tubeOne then
    if pTable >= 4 then
      pTable = 1
    else
      pTable = pTable + 1
    end
    love.audio.play(tubeSwitch)
  end

  --TUBE TWO
  if tube == tubeTwo then
    if pTable >= 7 or pTable < 5 then
      pTable = 5
    else
      pTable = pTable + 1
    end
    love.audio.play(tubeSwitch)
  end

  --TUBE THREE
  if tube == tubeThree then
    if pTable >= 10 or pTable < 8 then
      pTable = 8
    else
      pTable = pTable + 1
    end
    love.audio.play(tubeSwitch)
  end

  --TUBE FOUR
  if tube == tubeFour then
    if pTable >= 13 or pTable < 11 then
      pTable = 11
    else
      pTable = pTable + 1
    end
    love.audio.play(tubeSwitch)
  end

end

function paletteCheck(x, y)
  if x >= 160 and x <= 340 then
    if y >= 50 and y <= 180 then
      return true
    end
  end
end

function canvasCheck(x, y)
  if x >= 150 and x <= 630 then
    if y >= 235 and y <= 537 then
      return true
    end
  end
end
