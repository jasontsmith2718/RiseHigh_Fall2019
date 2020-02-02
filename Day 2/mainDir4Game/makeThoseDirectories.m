s = 'abcdefghijklmnopqrstuvwxyz';
for i = 1:50
    dirPC = [];
    for q = 1:4
        if rand() < .5
            dirPC = [dirPC num2str(round(rand()*8 + 1))];
        else
            dirPC = [dirPC s(round(rand()*25 + 1))];
        end
        
    end
    mkdir(dirPC)
    cd(dirPC)
    for j = 1:25
        dirC = [];
        for q = 1:3
            if rand() < .5
                dirC = [dirC num2str(round(rand()*8 + 1))];
            else
                dirC = [dirC s(round(rand()*25 + 1))];
            end
        end
        mkdir(dirC)
        cd(dirC)
        copyfile 'C:\Users\jason\Desktop\RISE-HIGH\day2\mainDir\shia.mp3'
        copyfile 'C:\Users\jason\Desktop\RISE-HIGH\day2\mainDir\Clue.txt'
        cd(['C:\Users\jason\Desktop\RISE-HIGH\day2\mainDir\' dirPC]);
    end
    cd('C:\Users\jason\Desktop\RISE-HIGH\day2\mainDir');    
end