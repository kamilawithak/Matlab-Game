%Initialize the game scene
gameScn = simpleGameEngine('spriteEngr.png', 1983, 1983, 1, [255, 255, 255]);

%create randomizers for the categories

catRandomizer = randperm(4);

%initialize each category with their sprites
categoryID.ANIMALS = [1 2 3 4];
categoryID.CLOTHES = [5 6 7 8];
categoryID.FRUITS  = [9 10 11 12];
categoryID.SEASONS = [13 14 15 16];

%initialize the categories that will be displayed to the user
categories = ["ANIMALS", "CLOTHES", "FRUITS", "SEASONS"];

while true
    %show the title and difficulty levels 
    playerView = [21; 19; 20];
    drawScene(gameScn, playerView);
    [r0, c0] = getMouseInput(gameScn); 
    level = playerView(r0, c0);
    easy = 19;
    hard = 20; 
    if isequal(level, easy)
        %initialize the categories that haven't been prompted
        categoriesRemaining = ["ANIMALS", "CLOTHES", "FRUITS", "SEASONS"];

        %randomly pick a category from the remaining categories
        category = categoriesRemaining(randi(numel(categoriesRemaining)));
        
        %initialize the board with the random sprites (3x3)
        randomizer = randperm(16);
        playerView = [randomizer(1:3);
                    randomizer(4:6);
                    randomizer(7:9)];

        %initialize what the board will display once the player has beat the game
        complete = [18, 18 ,18; 
            18, 18 ,18; 
            18, 18 ,18;];

    elseif isequal(level, hard)
        %initialize the categories that haven't been prompted
        categoriesRemaining = ["ANIMALS", "CLOTHES", "FRUITS", "SEASONS"];

        %randomly pick a category from the remaining categories
        category = categoriesRemaining(randi(numel(categoriesRemaining)));        
       
        %initialize the board with the random sprites (4x4)
        randomizer = randperm(16);
        playerView = [randomizer(1:4);
                    randomizer(5:8);
                    randomizer(9:12);
                    randomizer(13:16)];

        %initialize what the board will display once the player has beat the game
        complete = [18, 18 ,18, 18; 
            18, 18 ,18, 18; 
            18, 18 ,18, 18; 
            18, 18 ,18, 18;];
    else
        close(gameScn.my_figure);
        break;
    end
    %initialize a mask to track the selected tiles
    selectedMask = zeros(size(playerView));   

    %run the loop until the whole board is clear
    while ~isequal(playerView, complete)
        %draw the board and prompt user for input
        drawScene(gameScn, playerView);
        title("Pick n' Play");
        prompt = "Select all the " + category;
        promptText = xlabel(prompt);
        titleText = title("Pick n' Play");
        promptText.FontSize = 16;
        titleText.FontSize = 20;
        [r, c] = getMouseInput(gameScn); 
        clicked = playerView(r, c);
        correct = categoryID.(category);

        %if the user selects a correct answer then it will
        %be replaced by a check mark tile and it will mark
        %it as selected in the mask. if the answer 
        %is incorrect it will be temporarily replaced by
        %an x mark
        if ismember(clicked, correct)
            playerView(r, c) = 18; 
            selectedMask(r, c) = 1;
            drawScene(gameScn, playerView);
        else
            playerView(r, c) = 17;
            drawScene(gameScn, playerView);
            playerView(r, c) = clicked;
            pause(.5);
            drawScene(gameScn, playerView);
        end

        %checks to see if all the tiles from the current category
        %have been chosen, if they have it deletes that category from
        %categories remaining and changes to one of the other 3
        currentTiles = ismember(playerView, correct);
        if all(selectedMask(currentTiles) == 1)
            categoriesRemaining(categoriesRemaining == category) = [];
            if ~isempty(categoriesRemaining)
                category = categoriesRemaining(randi(numel(categoriesRemaining)));
            end
        end

        %ends the loop once the player has beat the game
        if isequal(playerView, complete)
            pause(1);
            break; 
        end
    end
end