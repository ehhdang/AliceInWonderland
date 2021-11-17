

def findMissing(textFile, audioFile):
    missing = []
    allWords = []
    with open(textFile, 'r') as f:
        for word in f.readlines():
            allWords.append(word)
    f.close()

    audioWords = []
    with open(audioFile, 'r') as f:
        for word in f.readlines():
            audioWords.append(word)
    f.close()

    for word in allWords:
        if word not in audioWords:
            missing.append(word)
            
    with open("words_that_dont_have_audio.txt", "w") as f:
        for word in missing:
            f.write(word)
    f.close()

if __name__ == "__main__":
    aliceFile = "/Users/kirtanamogili/Documents/TECH/Fall 2021/Junior Design/AliceInWonderland/Audio File Sorting/words_in_AliceInWonderland.txt"
    audioFile = "/Users/kirtanamogili/Documents/TECH/Fall 2021/Junior Design/AliceInWonderland/Audio File Sorting/words_that_have_audio.txt"
    findMissing(aliceFile, audioFile)