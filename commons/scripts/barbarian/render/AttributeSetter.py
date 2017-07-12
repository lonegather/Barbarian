'''
Created on 2017.7.12

@author: Sam
'''


def UI():
    AttributeSetter.create()

class AttributeSetter(object):
    
    use = None
    
    @classmethod
    def create(cls):
        cls.use = AttributeSetter()
    
    def __init__(self):
        print "new AttributeSetter"