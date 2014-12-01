#!/usr/bin/python
import time
from Quartz.CoreGraphics import CGEventGetLocation
from Quartz.CoreGraphics import CGEventCreate
from Quartz.CoreGraphics import CGEventCreateMouseEvent
from Quartz.CoreGraphics import CGEventPost
from Quartz.CoreGraphics import kCGEventMouseMoved
from Quartz.CoreGraphics import kCGEventLeftMouseDown
from Quartz.CoreGraphics import kCGEventLeftMouseDown
from Quartz.CoreGraphics import kCGEventLeftMouseUp
from Quartz.CoreGraphics import kCGMouseButtonLeft
from Quartz.CoreGraphics import kCGHIDEventTap

def mousePosition():
    theEvent = CGEventCreate(None)
    return CGEventGetLocation(theEvent)

def mouseEvent(type, x, y):
        theEvent = CGEventCreateMouseEvent(
                    None, 
                    type, 
                    (x, y), 
                    kCGMouseButtonLeft)
        CGEventPost(kCGHIDEventTap, theEvent)

def mouseMove(x, y):
        mouseEvent(kCGEventMouseMoved, x, y);

def mouseClick(x, y):
        mouseEvent(kCGEventLeftMouseDown, x, y);
        mouseEvent(kCGEventLeftMouseUp, x, y);

if __name__ == "__main__":
    time.sleep(10)
    while True:
        for j in xrange(0, 1000):
            cpos = mousePosition()
            mouseClick(cpos.x, cpos.y)
            time.sleep(0.03)
        time.sleep(5)
        
