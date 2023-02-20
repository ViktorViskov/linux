from os import system
START = 2
STOP = 25

def get_link(number :int) -> str:
    return "https://nl06.cdnsqu.com/s/FXFSNBEeMQr6IVip6ATemta1W0FBQUFBQUFBQUFBQmhDVFZCUUJC/star.trek-the.next.generation.axn.sci-fi-nf20/s07e%02d_480.mp4" % (number)

serie = START
while serie <= STOP:
    # print("wget '%s'" % (get_link(serie)))
    system("wget '%s'" % (get_link(serie)))
    serie += 1

