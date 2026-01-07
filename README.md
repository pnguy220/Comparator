In big or small, an adjustment to the seven segment decoder module was made so that both 
modules were not trying to control the Led port.  In this changed module called 
loose_sev_sec_dec, this module no longer has “led” as an additional output port compared to the 
module in problem 2. This allows the big_or small module to be the only one controlling the anodes 
of the seven segment display. 
