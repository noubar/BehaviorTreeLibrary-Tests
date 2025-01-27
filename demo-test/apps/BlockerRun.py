import asyncio
import os 
from random import *

class Repeater():

    def repeat(self, times: int =10, wait_between: int = 10):
        """
        times: How many times the constructor will be called.
        wait_between: How many seconds will be delayed between each call.
         """
        asyncio.run(self._repeater(times,wait_between))

    async def _repeater(self, times: int =10, wait_between: int = 10):
        await asyncio.sleep(1)
        for i in range(0,times):
            try:
                self.run()
            except Exception as e:
                print("iam here exceptionally")
                print(e)
                continue
            await asyncio.sleep(wait_between)
    
    def run(self):
        exe = os.path.join(os.path.dirname(__file__),"Notifier.exe") 
        os.startfile(exe)

Repeater().repeat(10,uniform(0,7))
