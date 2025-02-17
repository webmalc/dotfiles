package main

import (
	"fmt"
	"io"
	"os"
	"strings"

	"github.com/anaskhan96/soup"
)

const wordsFile string = "words.txt"
const wordsToeflfile string = "words_toefl.txt"

type record struct {
	word       string
	definition string
}

// Gets a random word from the dictionary file
func getRandomWord(filename string, ch chan record) {
	// dir, _ := filepath.Abs(filepath.Dir(os.Args[0]))
	// dictPath := path.Join(dir, "../assets/%s")
	// file, err := os.Open(fmt.Sprintf(dictPath, filename))
	file, err := os.Open(fmt.Sprintf("/home/webmalc/Projects/dotfiles/scripts/assets/%s", filename))

	checkAndPrintError(err)

	maxCount, err := lineCounter(file)

	checkAndPrintError(err)

	_, err = file.Seek(0, io.SeekStart)

	checkAndPrintError(err)

	word, _, err := readLine(file, getRandomInt(1, maxCount))

	checkAndPrintError(err)

	if err = file.Close(); err != nil {
		fmt.Printf("Error: %s", err)
	}
	ch <- record{word: word}
}

// Get random words from the dictionary files
func getRandomWords() [2]record {
	var words [2]record
	var filenames = [2]string{wordsFile, wordsToeflfile}

	messages := make(chan record)
	defer close(messages)

	for _, filename := range filenames {
		go getRandomWord(filename, messages)
	}
	for i := range words {
		words[i] = <-messages
	}
	return words
}

// Gets the word definition
func getDefinitionOld(word record, ch chan record) {
	var text string
	url := fmt.Sprintf("https://www.vocabulary.com/dictionary/%s", word.word)
	soup.Header("User-Agent", "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.27 Safari/537.36")
	response, err := soup.Get(url)
	checkAndPrintError(err)
	doc := soup.HTMLParse(response)
	el := doc.Find("p", "class", "short")
	if el.Error != nil {
		el = doc.Find("h3", "class", "definition")
	}
	if el.Error == nil {
		text = cleanString(el.FullText())
	}
	word.definition = text
	ch <- word
}

// Gets the word definition
func getDefinition(word record, ch chan record) {
	var text string
	url := fmt.Sprintf("https://www.dictionary.com/browse/%s", word.word)
	response, err := soup.Get(url)
	checkAndPrintError(err)
	doc := soup.HTMLParse(response)
	el := doc.Find("ol", "data-type", "definition-content-list")
	if el.Error == nil {
		elements := el.FindAll("li")
		if len(elements) > 2 {
			elements = elements[0:2]
		}
		for _, el := range elements {
			if el.Error == nil {
				text += cleanString(el.FullText())
			}
		}
	}
	word.definition = text
	ch <- word
}

// Gets definitions from the online dictionary
func getDefinitions(words [2]record) [2]record {
	var records [2]record

	messages := make(chan record)
	defer close(messages)

	for _, word := range words {
		go getDefinition(word, messages)
	}
	for i := range words {
		records[i] = <-messages
	}
	return records
}

// The entry point
func main() {
	records := getDefinitions(getRandomWords())

	for _, record := range records {
		title := strings.Title(record.word)
		fmt.Printf("${font Ubuntu Mono:size=14:weight=bold}${color2}%s${color}\n", title)
		fmt.Println("")
		definition := wrapWords(record.definition, 35)
		fmt.Printf("${font Ubuntu Mono:size=11}%s\n", definition)
	}
}
