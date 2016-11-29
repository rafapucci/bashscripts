import zipfile

PATH = "./"

def deszipa( local ):

    file = open(local, "rb")
    z = zipfile.ZipFile(file)
    nfile = ""

    for name in z.namelist():
                if ".zip" in name:
                    print "[DEBUG >>>] New zip file: " + name
                    z.extract(name, "")
                    deszipa(name)
    file.close()
    return;


print "[DEBUG >>>] Function zip"
deszipa(PATH + "arq.zip")
