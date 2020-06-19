from urllib.request import urlopen

url = urlopen("http://www.justa999.com/readNetFile.py")
for line in url:
    print(line.strip() )

#fileName = "F:\projects\python_test\cemc\pathfinder2.py"
fileName = "//f2/Volume_1/readme.txt"
f = open(fileName, "r")
Lines = f.readlines()
for line in Lines: 
    print(line.strip()) 
