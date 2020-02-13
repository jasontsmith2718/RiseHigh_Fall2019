'makeThoseDirectories/': Includes files for recreating
directory maze to one's preference.

'mainDirectory/': Too large to be included here, but has been
shared over Google Drive for the time being. This includes
the directory maze for the student's "scavenger hunt".
- 5 correct clues total (forms a sentence)
- Each decrypted sound file takes the form '####/###', which
gives the student the next directory and next clue.

After downloading onto each computer from Drive (or external memory)
place the contents inside of the 'day2/' folder.

'clues/': Contains all five noisy clues used in Spring 2020.

'clue.m' can be changed for another default soundbite

'Clue.txt' has the default text "Not here :)" and can also be changed.
** Making changes to the above requires rerunning "makeThoseDirectories.mat"
in order for any change to take effect.

# # # # # # # # # # # # # # # # # # # 

% % % Fun Fact % % %

Human adult speech (on average):
Male: [85 to 180 Hz]
Female: [165 to 255 Hz]

% % % % % % % % % % %

EA Tutorial Clip:
#A: bandstop, [7000 8000]
#B: lowpass, 7000

RH Students (the Hulk):
#A: bandstop, [6500 7500]
#B: lowpass, 6500

#1: 'b421/ign'
- (lowpass, 7000)
#2: 'h3gf/7o7'
- (lowpass, 5000)
#3: '4pw8/553'
- (lowpass, 4500)
#4: 'aa23/747' (highpass, 300)
#5: 'sp57/ai9' [(highpass, 300), (lowpass, 5000)]
- bandpass, [300 5000]


Message: "The eagle flies at sunrise."

-JS, Spring 2020