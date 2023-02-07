# epubtoraw
A little tool made to convert epub files to raw text.


# How to use

Install `pv`.

Build the go script:
```
$ go build etg.go
```
Make the scripts executable:

```
$ chmod +x etg start.sh
```

Then simply run the `start.sh` file. It'll create text files for each epub file in the directory.


# To Do
- Clean up the outputted text
- Add optional functionality to print out dialogues separately
- Attach speaker names to dialogues with machine learning
