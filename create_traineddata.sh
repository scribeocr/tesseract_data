## Create copy of original traineddata file
cp eng_original.traineddata eng.traineddata

## Extract eng.unicharset
combine_tessdata -e eng.traineddata eng.unicharset

## Create eng.punc-dawg using new character list
wordlist2dawg eng.punc eng.punc-dawg eng.unicharset

## Create eng.word-dawg using new character list
wordlist2dawg eng.wordlist eng.word-dawg eng.unicharset

## Replace eng.punc-dawg in eng.traineddata file
combine_tessdata -o eng.traineddata eng.punc-dawg eng.word-dawg

## Delete intermediate files
rm -f eng.word-dawg
rm -f eng.traineddata.__tmp__

## Create .gz version (used for Tesseract.js)
gzip -kf eng.traineddata