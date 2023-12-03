# pandoc-latex-panflute

A docker image with python and panflute, based on the official pandoc-latex image, see https://github.com/pandoc/dockerfiles.

The official image `pandoc/latex` does not contain `python` and `panflute`, so i created this image here, which I use in my projects.

## Usage

This is an example how to use this image using github actions to generate a PDF out of markdown files, based on https://github.com/pandoc/pandoc-action-example.

``` yaml
name: Generate PDF

on: push

jobs:
  convert_via_pandoc:
    runs-on: ubuntu-22.04
    steps:
      - uses: actions/checkout@v4
      - name: create file list
        id: files_list
        run: |
          mkdir output  # create output dir
          # this will also include README.md
          echo "files=$(printf '"%s" ' *.md)" > $GITHUB_OUTPUT
      - name: render book
        uses: docker://mschmid99/pandoc-latex-panflute:latest
        with:
          args: --toc --standalone --number-sections --output=output/book.pdf ${{ steps.files_list.outputs.files }} --bibliography ./bibliography.bib --csl=springer-basic-brackets.csl --filter ./panflute-filter-to-modify-document.py
    
      - uses: actions/upload-artifact@v3
        with:
          name: output
          path: output
```
