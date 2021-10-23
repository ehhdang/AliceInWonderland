special_characters = set(["!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "+", "_", "=", \
    "{", "}", "[", "]", "~", "`", ":", ";", ",", "<", ">", ".", "?", "/", "—", "’", "‘", "‘", "“", "”", "“"])

short_forms = set(["’s", "’ll", "’re", "’ve", "’m", "n’t", "’d"])

def remove_trailing_characters(word):
    l, r = 0, len(word)-1
    # remove special chars from the beginning and end
    while word[l] in special_characters:
        l += 1
    while word[r] in special_characters:
        r -= 1

    # remove short form from the end
    if word[r-2:r+1] in short_forms:
        r -= 3
    elif word[r-1:r+1] in short_forms:
        r -= 2
    else:
        r = r

    return word[l:r+1]

def process_story(filename):
    words = set()
    with open(filename, 'r') as f:
        for line in f.readlines():
            raw_words = list(line.split())
            for word in raw_words:
                word = remove_trailing_characters(word)

                # split composite words, e.g. farm-yard-while
                while "—" in word:
                    i = word.find("—")
                    words.add(word[:i].lower())
                    word = remove_trailing_characters(word[i+1:])

                while "-" in word:
                    i = word.find("-")
                    words.add(word[:i].lower())
                    word = remove_trailing_characters(word[i+1:])

                words.add(word.lower())

    with open("words_in_AliceInWonderland.txt", "w") as f:
        for word in words:
            f.write(word)
            f.write("\n")


if __name__ == "__main__":
    filename = "/Users/EmmaDang/Documents/AliceInWonderland/AliceInWonderland.txt"
    process_story(filename)