package main

import (
	"bufio"
	"bytes"
	"fmt"
	"github.com/bbrks/wrap"
	"io"
	"math/rand"
	"os"
	"regexp"
	"time"
)

// Wraps the string
func wrapWords(str string, max int) string {
	w := wrap.NewWrapper()
	return w.Wrap(str, max)
}

// Clean the string
func cleanString(str string) string {
	reLeadcloseWhtsp := regexp.MustCompile(`^[\s\p{Zs}]+|[\s\p{Zs}]+$`)
	reInsideWhtsp := regexp.MustCompile(`[\s\p{Zs}]{2,}`)
	final := reLeadcloseWhtsp.ReplaceAllString(str, "")

	return reInsideWhtsp.ReplaceAllString(final, " ")
}

// Counts number of lines in the reader
func lineCounter(r io.Reader) (int, error) {
	buf := make([]byte, 32*1024)
	count := 0
	lineSep := []byte{'\n'}

	for {
		c, err := r.Read(buf)
		count += bytes.Count(buf[:c], lineSep)

		switch {
		case err == io.EOF:
			return count, nil

		case err != nil:
			return count, err
		}
	}
}

// Prints an error
func checkAndPrintError(err error) {
	if err != nil {
		fmt.Println("Error:", err)
		os.Exit(1)
	}
}

// Generates the random number
func getRandomInt(min int, max int) int {
	rand.Seed(time.Now().UnixNano())
	return rand.Intn(max-min) + min
}

// Reads line from the reader
func readLine(r io.Reader, lineNum int) (line string, lastLine int, err error) {
	sc := bufio.NewScanner(r)
	for sc.Scan() {
		lastLine++
		if lastLine == lineNum {
			return sc.Text(), lastLine, sc.Err()
		}
	}
	return line, lastLine, io.EOF
}
