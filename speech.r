
print("ciao")

install.packages("audio") #to install library

library(audio)#to use library

currDriver <- current.audio.driver() #to check which audio driver is set
print(currDriver)
if(!currDriver)
{
    driversList <- audio.drivers() #if no driver set, what drivers are avaible?
    print(driversList)
    set.audio.driver(NULL)# sets the default audio driver
}



