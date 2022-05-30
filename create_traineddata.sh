## Create copy of original traineddata file
cp eng_original.traineddata eng.traineddata

## Extract eng.unicharset
combine_tessdata -e eng.traineddata eng.unicharset

## Create eng.punc-dawg using new character list
wordlist2dawg eng.punc eng.punc-dawg eng.unicharset

## Replace eng.punc-dawg in eng.traineddata file
combine_tessdata -o eng.traineddata eng.punc-dawg