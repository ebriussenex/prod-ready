package main

import (
	"log"
	"net/http"
	"github.com/go-chi/chi"
	"notes/internal/handler"
)

func main() {
	h := handler.NewHandler()
	r := chi.NewRouter()
	r.Get("/hello", h.Hello)
	err := http.ListenAndServe(":8080", r)
	log.Fatal(err)
	log.Print("Shutting down...")
}