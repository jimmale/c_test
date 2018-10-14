package main
import "fmt"
import "strconv"

func main() {
    var buf string;
    for i := 0; i<1000000000; i++{
      buf = ""
      buf = strconv.Itoa(i)
    }
    fmt.Println(buf)
}
