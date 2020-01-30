package main

import (
	"fmt"
	"github.com/anaskhan96/soup"
	"io"
	"os"
	"path"
	"path/filepath"
	"strings"
)

const wordsFile string = "words.txt"
const wordsToeflfile string = "words_toefl.txt"

// Gets a random word from the dictionary file
func getRandomWord(filename string, ch chan string) {
	dir, _ := filepath.Abs(filepath.Dir(os.Args[0]))
	dictPath := path.Join(dir, "../assets/%s")
	file, err := os.Open(fmt.Sprintf(dictPath, filename))

	checkAndPrintError(err)

	maxCount, err := lineCounter(file)

	checkAndPrintError(err)

	_, err = file.Seek(0, io.SeekStart)

	checkAndPrintError(err)

	word, _, err := readLine(file, getRandomInt(1, maxCount))

	checkAndPrintError(err)

	if err = file.Close(); err != nil {
		fmt.Println("Error: %s", err)
	}
	ch <- word
}

// Get random words from the dictionary files
func getRandomWords() [2]string {
	var words [2]string
	var filenames = [2]string{wordsFile, wordsToeflfile}

	messages := make(chan string)
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
func getDefinition(word string, ch chan string) {
	var text string
	url := fmt.Sprintf("https://www.vocabulary.com/dictionary/%s", word)
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
	ch <- text
}

// Gets definitions from the online dictionary
func getDefinitions(words [2]string) [2]string {
	var definitons [2]string

	messages := make(chan string)
	defer close(messages)

	for _, word := range words {
		go getDefinition(word, messages)
	}
	for i := range words {
		definitons[i] = <-messages
	}
	return definitons
}

// The entry point
func main() {
	words := getRandomWords()
	definitons := getDefinitions(words)

	for i, word := range words {
		title := strings.Title(word)
		fmt.Printf("${font Ubuntu Mono:size=16}%s\n", title)
		fmt.Println("")
		definition := wrapWords(definitons[i], 35)
		fmt.Printf("${font Ubuntu Mono:size=12}%s\n", definition)
	}
}
