package main

import (
	"net/http"
	"os"
	"time"

	"github.com/bmf-san/goblin"
)

func init() {
	location := os.Getenv("TIME_ZONE")
	loc, err := time.LoadLocation(location)
	if err != nil {
		loc = time.FixedZone(location, 9*60*60)
	}
	time.Local = loc
}

func main() {
	r := goblin.NewRouter()

	r.GET("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Hello World"))
	})

	http.ListenAndServe(":"+os.Getenv("SERVER_PORT"), r)
}
