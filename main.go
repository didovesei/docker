package main

import (
	"log"

	sl "github.com/opencontainers/selinux/go-selinux"
)

func main() {
	if err := sl.Chcon("b", "system_u:object_r:container_file_t:s0", false); err != nil {
		log.Fatalf("err: %v", err)
	}
	log.Printf("Done")
}
