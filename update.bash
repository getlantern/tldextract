#!/usr/bin/env bash

function die() {
  echo "$@"
  exit 1
}

set -e

curl -O https://publicsuffix.org/list/effective_tld_names.dat || die "Could not update tld names?"
go get -u github.com/jteeuwen/go-bindata/...
go-bindata -pkg tldextract -o tldnames.go ./effective_tld_names.dat || die "Could not update"
