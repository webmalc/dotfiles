package main

import "fmt"

func test() int {
	return 1 + 1

}

func main() {
	years := test()
	fmt.Printf("%d years old.\n", years)
}
