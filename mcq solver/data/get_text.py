from tika import parser

fileName = input("file name: ")

raw = parser.from_file(fileName)
with open('text_data.dat', 'w', encoding='utf-8') as f:
    f.write(raw['content'])

